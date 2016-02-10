
-- because the darkest time is 0.5
-- todo: find the formula for this?
function light_level_to_time_of_day(light_level)
    if light_level <= 0.14 then
        return 0.5
    elseif light_level <= 0.15 then
        return 0.58
    elseif light_level <= 0.16 then
        return 0.582
    elseif light_level <= 0.17 then
        return 0.585
    elseif light_level <= 0.18 then
        return 0.586
    elseif light_level <= 0.19 then
        return 0.588
    elseif light_level <= 0.20 then
        return 0.589
    elseif light_level <= 0.21 then
        return 0.5915
    elseif light_level <= 0.22 then
        return 0.594
    elseif light_level <= 0.23 then
        return 0.596
    elseif light_level <= 0.24 then
        return 0.598
    elseif light_level <= 0.25 then
        return 0.60
    elseif light_level <= 0.26 then
        return 0.6025
    elseif light_level <= 0.27 then
        return 0.604
    elseif light_level <= 0.28 then
        return 0.607
    elseif light_level <= 0.29 then
        return 0.6085
    elseif light_level <= 0.30 then
        return 0.61
    elseif light_level <= 0.31 then
        return 0.612
    elseif light_level <= 0.32 then
        return 0.615
    elseif light_level <= 0.33 then
        return 0.617
    elseif light_level <= 0.34 then
        return 0.618
    elseif light_level <= 0.35 then
        return 0.62
    elseif light_level <= 0.36 then
        return 0.6225
    elseif light_level <= 0.37 then
        return 0.625
    elseif light_level <= 0.38 then
        return 0.626
    elseif light_level <= 0.39 then
        return 0.6275
    elseif light_level <= 0.40 then
        return 0.63
    elseif light_level <= 0.41 then
        return 0.6325
    elseif light_level <= 0.42 then
        return 0.6345
    elseif light_level <= 0.43 then
        return 0.6365
    elseif light_level <= 0.44 then
        return 0.6375
    elseif light_level <= 0.45 then
        return 0.64
    elseif light_level <= 0.46 then
        return 0.6425
    elseif light_level <= 0.48 then
        return 0.645
    elseif light_level <= 0.49 then
        return 0.6475
    elseif light_level <= 0.50 then
        return 0.65
    elseif light_level <= 0.51 then
        return 0.6525
    elseif light_level <= 0.52 then
        return 0.655
    elseif light_level <= 0.53 then
        return 0.6575
    elseif light_level <= 0.55 then
        return 0.66
    elseif light_level <= 0.56 then
        return 0.6625
    elseif light_level <= 0.58 then
        return 0.665
    elseif light_level <= 0.59 then
        return 0.6675
    elseif light_level <= 0.60 then
        return 0.67
    elseif light_level <= 0.62 then
        return 0.6225
    elseif light_level <= 0.64 then
        return 0.675
    elseif light_level <= 0.65 then
        return 0.6775
    elseif light_level <= 0.66 then
        return 0.68
    elseif light_level <= 0.67 then
        return 0.685
    elseif light_level <= 0.69 then
        return 0.6875
    elseif light_level <= 0.70 then
        return 0.69
    elseif light_level <= 0.71 then
        return 0.6925
    elseif light_level <= 0.72 then
        return 0.695
    elseif light_level <= 0.74 then
        return 0.6975
    elseif light_level <= 0.75 then
        return 0.70
    elseif light_level <= 0.76 then
        return 0.7025
    elseif light_level <= 0.77 then
        return 0.705
    elseif light_level <= 0.78 then
        return 0.7075
    elseif light_level <= 0.80 then
        return 0.71
    elseif light_level <= 0.81 then
        return 0.7125
    elseif light_level <= 0.82 then
        return 0.715
    elseif light_level <= 0.84 then
        return 0.7175
    elseif light_level <= 0.85 then
        return 0.72
    elseif light_level <= 0.86 then
        return 0.7225
    elseif light_level <= 0.87 then
        return 0.725
    elseif light_level <= 0.88 then
        return 0.7265
    elseif light_level <= 0.90 then
        return 0.731
    elseif light_level <= 0.91 then
        return 0.7325
    elseif light_level <= 0.92 then
        return 0.734
    elseif light_level <= 0.93 then
        return 0.736
    elseif light_level <= 0.94 then
        return 0.737
    elseif light_level <= 0.95 then
        return 0.74
    elseif light_level <= 0.96 then
        return 0.742
    elseif light_level <= 0.97 then
        return 0.744
    elseif light_level <= 0.98 then
        return 0.746
    elseif light_level <= 0.99 then
        return 0.748
    else
        return 0.8
    end
end
