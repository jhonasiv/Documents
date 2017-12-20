%Questão 1

% este programa exibe a curva de posição linearizada e também um desenho do
% possível perfil do came para um raio base de 50 mm.

clear all;

%Condição 1:
x1 = [0,60,120];
y1 = [0,8,16];
P1 = polyfit(x1,y1,3);
vet1 = linspace(0,120,121);
res1 = polyval(P1,vet1);

%Condição 2:
x2 = [120,180];
y2 = [16,16];
P2 = polyfit(x2,y2,1);
vet2 = linspace(120,180,61);
res2 = polyval(P2,vet2);

%Condição 3:
x3 = [180, 188, 240, 292,300];
y3 = [ 16,15.9,   8, 0.1,  0];
P3 = polyfit(x3,y3,3);
vet3 = linspace(180,300,121);
res3 = polyval(P3,vet3);

%Condição 4:
x4 = [300,360];
y4 = [0,0];
P4 = polyfit(x4,y4,1);
vet4 = linspace(300,360,61);
res4 = polyval(P4,vet4);

%Grafico:
clc;
plot(vet1,res1,'b',vet2,res2,'b',vet3,res3,'b',vet4,res4,'b');
axis([0,360,0,16.5]);
title('Deslocamento do came');
xlabel('Graus');
ylabel('Deslocamento [mm]');

%Amostra do came:
a = 50;

theta = linspace(0,2*pi);
x = a*cos(theta);
y = a*sin(theta);

theta1 = linspace(0,2*pi/3,121);
theta2 = linspace(2*pi/3,pi,61);
theta3 = linspace(pi,5*pi/3,121);
theta4 = linspace(5*pi/3,2*pi,61);

x1 = (a + res1).*cos(theta1);
y1 = (a + res1).*sin(theta1);
x2 = (a + res2).*cos(theta2);
y2 = (a + res2).*sin(theta2);
x3 = (a + res3).*cos(theta3);
y3 = (a + res3).*sin(theta3);
x4 = (a + res4).*cos(theta4);
y4 = (a + res4).*sin(theta4);

figure;plot(x1,y1,'m',x2,y2,'m',x3,y3,'m',x4,y4,'m',x,y,'--',0,0,'+');
axis equal;
title('Amostra com raio base de 50 mm');