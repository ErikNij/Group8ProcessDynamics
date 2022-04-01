function [s,K,A,tau,tau_D] = TransferFunctionFinder

directory = 'C:\Users\20191255\Documents\GitHub\Group8ProcessDynamics\6E8X0_RL_StartUp_Software\Experiment files - Live Interaction (6E8X0) Q3 2021-2022 7877-20817\20817_setupOutput\ExperimentTTS_20817.mat';
IDNumber = directory(end-8:end-4);

DataOut = importdata(directory);

PumpFlow_L__s__In1 = table2array(DataOut(:,1));
ScopeWaterLevelTank1_mm__In1 = table2array(DataOut(:,2));
ValvePostion = table2array(DataOut(:,3));
ValveSetValue= table2array(DataOut(:,4));
time = table2array(DataOut(:,5));

%Trimming the data set to the test range

TestRange = PumpFlow_L__s__In1 > 0;
TrimmedPumpFlow = PumpFlow_L__s__In1(TestRange);
TrimmedTime = time(TestRange);
TrimmedWaterLevel = ScopeWaterLevelTank1_mm__In1(TestRange);

%Correcting for the time 
TrimmedTime = TrimmedTime - TrimmedTime(1);

A = TrimmedPumpFlow(1);
len = length(TrimmedWaterLevel);
asy = mean(TrimmedWaterLevel(len-100:len));
K = asy / A;

HowCloseToTau = TrimmedWaterLevel - asy;
tau = TrimmedTime(min(HowCloseToTau)  == HowCloseToTau);
opts = optimoptions('lsqnonlin');
tau_D = lsqnonlin(@Tau_D_Error,0.1,0,100,opts,K,A,tau,TrimmedWaterLevel,TrimmedTime);
%tau_D = 0;

s = tf(K,[tau-tau_D,1],'InputDelay',tau_D);


end






