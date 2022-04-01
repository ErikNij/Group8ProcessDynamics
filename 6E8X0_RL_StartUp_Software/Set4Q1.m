function [] = Set4Q1 (z,p1,p2)
p(1) = p1;
p(2) = p2;

sys = tf([1,-z],[1,-sum(p),p(1)*p(2)]);
step(sys)
%impulse(sys)
%pzmap(sys)
