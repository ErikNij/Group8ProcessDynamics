function [err] = SimulationErrFinder(Guesses, TargetH_mm)
PGuess = Guesses(1);
IGuess = Guesses(2);
DGuess = Guesses(3);
%NGuess = Guesses(4);


%load("RL_TTS1_Busses_6e8x0.mat","Heights","Pumps","ValveSICO","ValvesSOCI");
%TunableParams
save('GuessValues','PGuess','IGuess','DGuess','TargetH_mm')
out = sim('RL_TTS1_TOP_SIM_6E8X0.slx');

heights = out.logsout{1}.Values.Data;

err = heights - TargetH_mm;

end