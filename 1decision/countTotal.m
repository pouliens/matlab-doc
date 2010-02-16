function [x, y] = countTotal(targets, targetValue)
    x = 0;
    y = 0;
    for i = 1:length(targets)
        if targets(i) == targetValue
            x = x + 1;
        else
            y = y + 1;
        end
    end