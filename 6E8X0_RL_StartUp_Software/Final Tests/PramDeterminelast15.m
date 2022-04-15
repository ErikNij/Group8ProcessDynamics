function [targetHeight_mm, valve_position] = PramDetermine(Ctime)

if Ctime < 300
    targetHeight_mm = 250;
    valve_position = 1;
elseif Ctime < 600
    targetHeight_mm = 350;
    valve_position = 1;
elseif Ctime < 900
    targetHeight_mm = 250;
    valve_position = 1;
elseif Ctime < 1200
    targetHeight_mm = 450;
    valve_position = 1;
else
    targetHeight_mm = 250;
    valve_position = 1;
end

end