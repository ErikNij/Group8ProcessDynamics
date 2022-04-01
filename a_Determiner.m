function [Big_A_cm2,little_a_cm2] = a_Determiner (~)

Basedirectory = 'C:\Users\20191255\Documents\GitHub\Group8ProcessDynamics\6E8X0_RL_StartUp_Software\Fancy Auto Tester\6E8X0_RL_StartUp_Software\results\results\results\ExperimentTTS_';
baseID = 20994;
big_area_cm2 = zeros(5,1);
little_area_cm2 = zeros(5,1);
many_little_areas_cm2 = zeros(10,1);
g = 9.81;

 i = 1;

while i <=5
    currentID = baseID + i - 1;
    fullDir = strcat(Basedirectory,int2str(currentID),'.mat');
    DataOut = importdata(fullDir);
    PumpFlow_L__s__In1 = table2array(DataOut(:,1));
    ScopeWaterLevelTank1_mm__In1 = table2array(DataOut(:,2));
    ValvePostion = table2array(DataOut(:,3));
    ValveSetValue= table2array(DataOut(:,4));
    time = table2array(DataOut(:,5));

    deltaL = ScopeWaterLevelTank1_mm__In1(3000) - ScopeWaterLevelTank1_mm__In1(1);
    deltaT = time(3000) - time(1);

    pumpFlow_L_per_sec = PumpFlow_L__s__In1(1500);

    slope_mm_Per_sec = deltaL/deltaT; 
    slope_dm_Per_sec = slope_mm_Per_sec / 100;

    area_dm2 = pumpFlow_L_per_sec / slope_dm_Per_sec;
    big_area_cm2(i) = area_dm2 *100;
    i = i + 1
end
Big_A_cm2 = mean(big_area_cm2);
while (6 <= i) && (i<=10)
    currentID = baseID + i - 1;
    fullDir = strcat(Basedirectory,int2str(currentID),'.mat');
    DataOut = importdata(fullDir);
    PumpFlow_L__s__In1 = table2array(DataOut(:,1));
    ScopeWaterLevelTank1_mm__In1 = table2array(DataOut(:,2));
    ValvePostion = table2array(DataOut(:,3));
    ValveSetValue= table2array(DataOut(:,4));
    time = table2array(DataOut(:,5));

    deltaL = ScopeWaterLevelTank1_mm__In1(3150) - ScopeWaterLevelTank1_mm__In1(3100);
    deltaT = time(3150) - time(3100);
    Hmean_mm = ScopeWaterLevelTank1_mm__In1(3125);
    Hmean_m = Hmean_mm / 1000;

    slope_mm_Per_sec = deltaL/deltaT;
    slope_m_Per_sec = slope_mm_Per_sec / 1000;

    Big_A_ms = Big_A_cm2 / 100;

    little_a_m2 = -Big_A_ms / sqrt(2*g*Hmean_m) * slope_m_Per_sec; 
    little_area_cm2(i-5) = little_a_m2 *100;

    i = i + 1
end
little_a_cm2 = mean(little_area_cm2);
while (11<=i) && (i<=20)
    currentID = baseID + i - 1;
    fullDir = strcat(Basedirectory,int2str(currentID),'.mat');
    DataOut = importdata(fullDir);
    PumpFlow_L__s__In1 = table2array(DataOut(:,1));
    ScopeWaterLevelTank1_mm__In1 = table2array(DataOut(:,2));
    ValvePostion = table2array(DataOut(:,3));
    ValveSetValue= table2array(DataOut(:,4));
    time = table2array(DataOut(:,5));

    deltaL = ScopeWaterLevelTank1_mm__In1(3150) - ScopeWaterLevelTank1_mm__In1(3100);
    deltaT = time(3150) - time(3100);
    Hmean_mm = ScopeWaterLevelTank1_mm__In1(3125);
    Hmean_m = Hmean_mm / 1000;

    slope_mm_Per_sec = deltaL/deltaT;
    slope_m_Per_sec = slope_mm_Per_sec / 1000;

    Big_A_ms = Big_A_cm2 / 100;

    little_a_m2 = -Big_A_ms / sqrt(2*g*Hmean_m) * slope_m_Per_sec; 
    many_little_areas_cm2(i-10) = little_a_m2 *100;
    SetpercentOpen = linspace(10,100,10);
    RealPercentOpen(i-10) = ValvePostion(3125); 
    i = i + 1
end

 %plot(RealPercentOpen,many_little_areas_cm2)
 hold on
 %plot(RealPercentOpen,SetpercentOpen/100)
plot(SetpercentOpen,RealPercentOpen)
plot(SetpercentOpen,many_little_areas_cm2)


end


