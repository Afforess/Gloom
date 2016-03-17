require "defines"
require "libs/logger"
require "libs/light"

script.on_event(defines.events.on_tick, function(event)
    local light = get_available_light()
    global.current_light = light
    local time_of_day = light_level_to_time_of_day(light)
    game.daytime = time_of_day
end)

light_trends = {brightening = {min_length = 60 * 60 * 2, max_length = 60 * 60 * 10, odds = 50, intensity =  0.4},
                clear =       {min_length = 60 * 60 * 1, max_length = 60 * 60 * 3,  odds = 65, intensity =  0.1},
                gloomy =      {min_length = 60 * 60 * 3, max_length = 60 * 60 * 12, odds = 80, intensity = -0.2},
                darkening =   {min_length = 60 * 60 * 2, max_length = 60 * 60 * 7,  odds = 60, intensity = -0.5}
                }

function get_available_light()
    if global.light_queue then global.light_queue = nil end
    if not global.light_trend then begin_new_light_trend("clear") end
    
    if global.trend_expires < game.tick then
        begin_new_light_trend(choose_light_trend(global.light_trend))
    end

    return math.min(1, math.max(0.14, global.current_light + global.trend_delta))
end

function begin_new_light_trend(trend)
    local data = light_trends[trend]
    local time_length = math.random(data.min_length, data.max_length)
    global.trend_expires = game.tick + time_length
    global.trend_delta = data.intensity / time_length
    global.light_trend = trend
    global.current_light = 1 - game.darkness
    Logger.log("Beginning trend: " .. trend .. ", Expires in " .. (time_length / 60) .. "s, Delta: " .. global.trend_delta)
end

function choose_light_trend(excluded_trend)
    local best_roll = 0
    local best_trend = nil
    for trend, data in pairs(light_trends) do
        if trend ~= excluded_trend then
            local roll = math.random(data.odds)
            if roll > best_roll then
                best_roll = roll
                best_trend = trend
            end
        end
    end
    
    return best_trend
end
