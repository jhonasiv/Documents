%Jhonas Prado Moura         11411EMT009
%Ian Cardoso                11411EMT016
%Hudson Camara Pires        11311EMT023
%Ronaldo Cesar de Almeida   11411EMT019

%                   Questao 4

%Uma massa desliza ao longo de uma haste retilínea lisa que gira com
%velocidade angular constante num plano horizontal. Descreva seu movimento
%pelo formalismo de Lagrange.
clear();
clc();
syms w acel_m r;

vet_acel = zeros(12,10);
for w = pi/6:pi/6:2*pi
    for r = 0.1:0.1:1
        eqc = acel_m == w^2*r;
        vet_acel(int16(1+(w-pi/6)/(pi/6)),int16(1+(r-0.1)/0.1)) = solve(eqc, acel_m);
    end
end
    
figure(1);
y = pi/6:pi/6:2*pi;
x = 0.1:0.1:1;
surf(x,y, vet_acel)
title('Variando posicao e velocidade angular');
ylabel('Omega[rad/s]');
xlabel('Distancia[m]');
zlabel('Aceleracao de m[m/s^2]');
syms r;
vet_pos = zeros(12,20);
for w = pi/6:pi/6:2*pi
    for acel_m = 0.1:0.5:10
        eqc =  acel_m == w^2*r;
        vet_pos(int16(1+(w-pi/6)/(pi/6)),int16(1+(acel_m-0.1)/0.5)) = solve(eqc, r);
    end
end
    
figure(2);
y = pi/6:pi/6:2*pi;
x = 0.1:0.5:10;
surf(x,y, vet_pos)
title('Variando aceleracao e velocidade angular');
ylabel('Omega[rad/s]');
xlabel('Aceleracao[m/s^2]');
zlabel('Posicao de m[m]');