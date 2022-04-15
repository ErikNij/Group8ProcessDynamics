    function [] = ResultPlotter

directory = 'C:\Users\20191255\Documents\GitHub\Group8ProcessDynamics\6E8X0_RL_StartUp_Software\Experiment files - Live Interaction (6E8X0) Q3 2021-2022 7792-20677\20677_setupOutput\ExperimentTTS_20677.mat';
target = 370;

IDNumber = directory(end-8:end-4);

DataOut = importdata(directory);

PumpFlow_L__s__In1 = table2array(DataOut(:,1));
ScopeWaterLevelTank1_mm__In1 = table2array(DataOut(:,2));
ValvePostion = table2array(DataOut(:,3));
ValveSetValue= table2array(DataOut(:,4));
time = table2array(DataOut(:,5));

steps = length(time);
targetLine = ones(steps,1)*target;
% Create plots
t = tiledlayout(4,1);
t.Title.String = "Manual Control (Constant Pumping)";
ax1 = nexttile;
plot(ax1,time,ScopeWaterLevelTank1_mm__In1)
hold on
plot(ax1, time, targetLine,'--r')

ax2 = nexttile;
plot(ax2,time,ScopeWaterLevelTank1_mm__In1)
hold on
ylim([target-5,target+5])
hold on
plot(ax2, time, targetLine,'--r')

ax3 = nexttile;
plot(ax3,time,PumpFlow_L__s__In1)

ax4 = nexttile;
plot(ax4,time,ValvePostion);
hold on
plot(ax4,time,ValveSetValue);
legend('Set Postion','Acutal Postion');
ylim([0,1.1])

title(ax1,"Water Level")
title(ax2,"Water Level (Zoomed in)")
title(ax3,"Pump flow (L/s)")
title(ax4,"Valve Postion (0<->1)")

% Link the axes
linkaxes([ax1,ax2,ax3,ax4],'x');
