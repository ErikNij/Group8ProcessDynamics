%% Variables
A = 0.0202; %m^2
a0 = 0.66e-4; %m^2 
g = 9.81; %m/(s^2)
h0 = 0.25; %m

Ts=1/10; % do not use larger Ts as this will give poor perfromance of the valve position control

pump_flow= 0.05;
valve_position=0.5;
    
%% PID Controller

K = (sqrt(2*g*h0))/(a0*g);
tau = (A*sqrt(2*g*h0))/(a0*g);
lamda = 0.1;

I = 1/(K*lamda);
P = tau/(K*lamda);
D = 0;
C = 1;

save IMC_Controller.mat