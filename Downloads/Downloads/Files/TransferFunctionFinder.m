function [s,K,A,tau,tau_D] = TransferFunctionFinder
testNum = 1;
while testNum <= 10
    TrueExpNum = 20857 + testNum;
    directory = strcat('C:\Users\20191255\Documents\GitHub\Group8ProcessDynamics\Downloads\Downloads\Files\ExperimentTTS_',int2str(TrueExpNum),'.mat');

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

    A(testNum) = TrimmedPumpFlow(1);
    len = length(TrimmedWaterLevel);
    asy = mean(TrimmedWaterLevel(len-100:len));
    K(testNum) = asy / A(testNum);

    HowCloseToTau = TrimmedWaterLevel - (0.632*asy);
    if testNum == 10
        b = 1 + 1
    end
    
    tau(testNum) = mean(TrimmedTime(min(abs(HowCloseToTau))  == abs(HowCloseToTau)));
    opts = optimoptions('lsqnonlin');
    tau_D(testNum) = lsqnonlin(@Tau_D_Error,0.1,0,100,opts,K(testNum),A(testNum),tau(testNum),TrimmedWaterLevel,TrimmedTime);
    %tau_D = 0;

    s(testNum) = tf(K(testNum),[tau(testNum)-tau_D(testNum),1],'InputDelay',tau_D(testNum));
    testNum = testNum + 1
end
i = 1;
x = linspace(0,20*60,20*60*10);
while i<= 10
y(i,:) = K(i)*A(i)*(1-exp(-x/tau(i)));
hold on
plot(x,y(i,:))
i = i +1
end    
end






