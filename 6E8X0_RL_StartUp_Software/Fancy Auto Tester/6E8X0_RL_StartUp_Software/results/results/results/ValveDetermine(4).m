function [valveValue] = ValveDetermine(t)
valveValue = 0.0;
if t > 600
    valveValue = 0;
end
end
