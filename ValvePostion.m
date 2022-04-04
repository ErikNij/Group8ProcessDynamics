function [ValvePostion] =  ValvePostion (~)

Basedirectory = 'C:\Users\20191255\Documents\GitHub\Group8ProcessDynamics\6E8X0_RL_StartUp_Software\Fancy Auto Tester\6E8X0_RL_StartUp_Software\results\results\results\ExperimentTTS_';
baseID = 20994;

ValvePostion = ones(5000,10);

g = 9.81;

i = 10;



while i <= 20

    currentID = baseID + i - 1;
    fullDir = strcat(Basedirectory,int2str(currentID),'.mat');
    DataOut = importdata(fullDir);
    PumpFlow_L__s__In1 = table2array(DataOut(:,1));
    ScopeWaterLevelTank1_mm__In1 = table2array(DataOut(:,2));
    ValvePostion(:,i-9) = table2array(DataOut(5000:9999,3));
    ValveSetValue= table2array(DataOut(:,4));
    time = table2array(DataOut(:,5));

    i = i + 1;

end
end

