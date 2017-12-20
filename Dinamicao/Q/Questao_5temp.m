%   Jhonas Prado Moura          11411EMT009
%   Ian Cardoso                 11411EMT014
%   Ronaldo Cesar de Almeida    11411EMT019
%   Hudson Camara Pires         11311EMT023

% Aplicar o formalismo lagrangiano para obter as equações de movimento de um
% pêndulo duplo plano.
clc();
syms l1 l2 m1 m2;
syms x1(t) teta1(t) vx1(t);
syms y1(t) teta1(t) vy1(t);
syms x2(t) teta2(t) vx2(t);
syms y2(t) teta2(t) vy2(t);
g = int16(9.8);
x1 = l1*sin(teta1);
vx1 = diff(fx1,t);

y1 = l1*cos(teta1);
% fy1 = y1 == l1*cos(teta1);
vy1 = diff(y1, t);

x2 = l1*sin(teta1) + l2*sin(teta2);
vx2 = diff(x2, t);

y2 = l1*cos(teta1) + l2*cos(teta2);
vy2 = diff(y2, t);

v1 = vx1^2 + vy1^2;
v2 = vx2^2 + vy2^2;

T = m1/2 * v1^2 + m2/2 * v2^2;

%Como m1 está abaixo da parede, usaremos ela como referencial
V = -m1*g*(y1) - m2*g*(y2);

L = T - V;




