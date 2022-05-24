function [FinalCoeffs] = PIDNFinder(~)
%Setting the target height
TargetH_mm = 250;

opts =optimoptions('lsqnonlin','display','iter-detailed','UseParallel',true,'FiniteDifferenceStepSize',5e-5);
%Setting bounds and intial conditions
ub = [0.1/250,0.1/2500,0];
lb = [0,0,0];
init = ub/2;
%Running the built in optimization tool.
[FinalCoeffs] = lsqnonlin(@SimulationErrFinder,init,lb,ub,opts,TargetH_mm);

end
