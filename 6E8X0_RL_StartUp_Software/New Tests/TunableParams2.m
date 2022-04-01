pump_flow= 0.1;
while pump_flow<=1
    Ts=1/10; % do not use larger Ts as this will give poor perfromance of the valve position control
    valve_position= 0.5;
    FileName = strcat('RL_TTS1_Controller_6E8X0 - Copy (',int2str(pump_flow*10),').mat');
    save (FileName)
    pump_flow = pump_flow + 0.1
end
