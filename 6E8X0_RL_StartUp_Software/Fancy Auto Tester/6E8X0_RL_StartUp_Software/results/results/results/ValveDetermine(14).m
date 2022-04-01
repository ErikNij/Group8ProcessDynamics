function [valveValue] = ValveDetermine(t)
valveValue = 0.0;
if t > 300
    valveValue = .5;
end
end
