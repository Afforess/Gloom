
-- official darkness formula: http://pastebin.com/raw/cRaYBrUn
function light_level_to_time_of_day(light_level)
    if light_level <= 0.14 then
        return 0.5
    elseif light_level > 0.99 then
        return 0.8
    end
    return 0.2 * light_level + 0.55
end
