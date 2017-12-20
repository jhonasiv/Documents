%   Jhonas Prado Moura          11411EMT009
%   Ian Cardoso                 11411EMT014
%   Ronaldo Cesar de Almeida    11411EMT019
%   Hudson Camara Pires         11311EMT023

% Aplicar o formalismo lagrangiano para obter as equações de movimento de um
% pêndulo duplo plano.
clc();
syms l1 l2 m1 m2 teta1 teta2 v1 w1 w2 a1 a2 t;
g = 9.8;
l1 = 2;
l2 = 0.5;
% w1 = pi/10;
% w2 = pi/6;
m1 = 1;
m2 = 3;

%Teta1 deve ser limitado entre - pi/2 e + pi/2
teta1 = -pi/4;
teta2 = 0;
t = 0;

eq1 =  v1 == (l1 * w1 * cos(teta1))^2 + (-l1*w1*sin(teta1))^2;
eq2 = v1 == w1*l1;
sols = solve([eq1, eq2], [w1, v1])
sols.w1
sols.v1

% while teta1 < pi/2
%     lag1 = (m1+m2)*l1^2*a1 + m2*l1*l2*a2*cos(teta1 - teta2) + m2*l1*l2*w2^2*sin(teta1 - teta2) + (m1+m2)*g*l1*sin(teta1) == 0;
%     lag2 = m2*l2^2*a2 + m2*l1*l2*cos(teta1 - teta2)*a1 - m2*l1*l2*w1^2*sin(teta1-teta2) + m2*g*l2*sin(teta2) == 0;
%     sol = solve([lag1, lag2],[a2,a1]);
%     double(sol.a2)
%     double(sol.a1)
%     
%     teta1 = teta1 + w1
%     teta2 = teta2 + w2
%     t = t+1;
% end
