function [err] = Tau_D_Error(Tau_D_guess,K,A,Tau,realData,time)

fulltimeSimulation = K*A*(1-exp(-1*(time-Tau_D_guess)/(Tau-Tau_D_guess)));
correctedSimulation = fulltimeSimulation;
correctedSimulation(time<Tau_D_guess) = 0;

err = realData - correctedSimulation;

end