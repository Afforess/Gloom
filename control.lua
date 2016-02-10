require "defines"
require "libs/logger"
require "libs/light"

script.on_event(defines.events.on_tick, function(event)
    if event.tick % 60 == 0 then
        local light = get_available_light()
        local time_of_day = light_level_to_time_of_day(light)
        game.daytime = time_of_day
    end
end)

function get_available_light()
    if not global.light_queue then global.light_queue = {} end
    -- 18 -> 3 minutes
    if #global.light_queue < 180 then
        calculate_future_light(180)
        Logger.log("Light queue: " .. serpent.line(global.light_queue))
    end
    return table.remove(global.light_queue, 1)
end

-- calculates future light for the next 3 minutes of gameplay, to ensure a smooth trend
function calculate_future_light(extra)
    local latest_light = game.darkness
    if #global.light_queue > 0 then
        latest_light = global.light_queue[#global.light_queue]
    end
    local brightening = math.random(100) >= 75 -- 25% chance of brightening
    if brightening then
        local brighten = (math.random(30) / 100) + 0.05
        local final_light = math.min(1.0, latest_light + brighten)
        Logger.log("Brightening, target light: " .. final_light .. ", current light: " .. latest_light)
        for i = 1, extra do
            -- strict average, to check how close we are to reaching our target final_light
            local delta = (final_light - latest_light) / extra
            local expected_light = latest_light + delta
            table.insert(global.light_queue, expected_light)
            
            latest_light = expected_light
        end
    else
        local darken = (math.random(45) / 100) + 0.05
        local final_light = math.max(0, latest_light - darken)
        Logger.log("Darkening, target light: " .. final_light .. ", current light: " .. latest_light)
        for i = 1, extra do
            -- strict average, to check how close we are to reaching our target final_light
            local delta = (final_light - latest_light) / extra
            local expected_light = latest_light + delta
            table.insert(global.light_queue, expected_light)
            
            latest_light = expected_light
        end
    end
end
