function [] = FinalResultPlotter2

baseDir = 'C:\Users\20191255\Documents\GitHub\Group8ProcessDynamics\6E8X0_RL_StartUp_Software\Final Tests\ResultsTest2';
j = 1;
target = 250;

rejections = linspace(0,350,350);
reject1 = ones(350,1)*300;
reject2 = ones(350,1)*600;
reject3 = ones(350,1)*900;

t = tiledlayout(3,1);
t.TileSpacing = 'compact';
t.Padding = 'compact';
t.Title.String = "Automatic Control Setpoint Tracking Test";
ax1 = nexttile

while j <= 15
    FullDir = append(baseDir,'\',int2str(j),"~\Output\",int2str(j),".mat");
    DataOut = importdata(FullDir);

    PumpFlow_L__s__In1 = table2array(DataOut(:,1));
    ScopeWaterLevelTank1_mm__In1 = table2array(DataOut(:,2));
    ValvePostion = table2array(DataOut(:,3));
    ValveSetValue= table2array(DataOut(:,4));
    time = table2array(DataOut(:,5));
    
    if j<=5
        color(j) = "r";
    elseif j<=10
        color(j) ='k';
    else
        color(j) = 'b';
    end
    plot(time,ScopeWaterLevelTank1_mm__In1,color(j))
    hold on
    
    j = j + 1;

end
plot(reject1,rejections,"--m")
plot(reject2,rejections,"--m")
plot(reject3,rejections,"--m")
steps = length(time);
targetLine = ones(steps,1)*450;
targetLine(time<900) = 250;
targetLine(time<600) = 350;
targetLine(time<300) = 250;

plot(time,targetLine,"--m")
title("Height of Liquid")
ylim([0,460])
ylabel("Height of tank(mm)")


hold off
j = 1;
ax2 = nexttile
hold on
while j <=15
    FullDir = append(baseDir,'\',int2str(j),"~\Output\",int2str(j),".mat");
    DataOut = importdata(FullDir);
    PumpFlow_L__s__In1 = table2array(DataOut(:,1));
    time = table2array(DataOut(:,5));
    PumpFlow_L__s__In1(PumpFlow_L__s__In1>0.1) = 0.1;
    PumpFlow_L__s__In1(PumpFlow_L__s__In1<0) = 0;
    plot(time,PumpFlow_L__s__In1,append(color(j),"x"))
    hold on
    j = j + 1;
end
plot(reject1,rejections,"--m")
plot(reject2,rejections,"--m")
plot(reject3,rejections,"--m")
title("Set Pump Flow")
ylim([0,0.1])
ylabel("Deserired Pump flow (L/s)")
j = 1;
ax3 = nexttile
hold on

while j <=15
    FullDir = append(baseDir,'\',int2str(j),"~\Output\",int2str(j),".mat");
    DataOut = importdata(FullDir);
     ValvePostion = table2array(DataOut(:,3));
    time = table2array(DataOut(:,5));
    plot(time,ValvePostion,color(j));
    j = j + 1;
end
plot(reject1,rejections,"--m")
plot(reject2,rejections,"--m")
plot(reject3,rejections,"--m")
title("Disturbance (Valve postion)")
ylim([0,1])
xlabel("Time (s)")
ylabel("Valve postion")

linkaxes([ax1,ax2,ax3],'x')
end





