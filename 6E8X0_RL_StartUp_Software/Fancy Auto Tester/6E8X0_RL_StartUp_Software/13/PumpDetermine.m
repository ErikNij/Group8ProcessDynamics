function [PumpValue] = PumpDetermine (t)
    PumpValue = 0.03;
    if t > 300
        PumpValue = 0;
    end
end

