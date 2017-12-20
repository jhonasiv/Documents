%   Jhonas Prado Moura          11411EMT009
%   Ian Cardoso                 11411EMT014
%   Ronaldo Cesar de Almeida    11411EMT019
%   Hudson Camara Pires         11311EMT023


%                               Questao 3
%Obter a lagrangiana e as respectivas equações de Lagrange para o sistema
%mecânico representado, considerando desprezível as massas da roldana e do fio
%inextensível, e que o comprimento natural da mola é ?.

clear();
syms m1 m2 m3 x2 x3 k;
syms a2 a3;        %em m/s²     
g = 9.8;           %em m/s        
m = 0.5;           %em m
k = 100;           %em N/m
m1 = 12;           %em kg
m2 = 15;           %em kg
m3 = 17;           %em kg
x2 = 2;            %em m
x3 = 3.5;          %em m


%Variaveis do plot
x = zeros(50,1);
y = zeros(50,1);


%Coordenada Y apontando para cima

%Sistemas prontos
sist1 = (m1 + m2)*a2 - (m2 - m1)*g - k*(x3 - x2 - m) == 0;
sist2 = m3*a3 - m3*g + k*(x3 - x2 - m) == 0;

%Vetor de valores para as aceleracoes
vet_a2 = zeros(16,16);

%Variando as massas m1 e m2
for m1 = 5:1:20
    for m2 = 5:1:20
        sist1 = (m1 + m2)*a2 - (m2 - m1)*g - k*(x3 - x2 - m) == 0;
        vet_a2(m1-4,m2-4) = solve(sist1, a2);
    end
end

%Quando m2 for maior, a2 sera maior
figure(1)
x = 5:1:20;
y = 5:1:20;
surf(x, y, vet_a2);
title('Variando m1 e m2')
xlabel('Massa 2[kg]');
ylabel('Massa 1[kg]');
zlabel('Aceleracao 2');
xlim([5 20])
ylim([5 20])

%Variando a massa m3 e k
vet_a3 = zeros(21,16);
for k = 20:5:120
    for m3 = 5:1:20
        sist2 = m3*a3 - m3*g + k*(x3 - x2 - m) == 0;
        vet_a3(1+(k-20)/5,m3-4) = solve(sist2, a3);
    end
end

figure(2)
xFig = 5:1:20;
yFig = 20:5:120;
surf(xFig, yFig, vet_a3);
set(gcf(), 'Renderer', 'zbuffer');
title('Variando m3 e k');
xlabel('Massa 3[kg]');
ylabel('Constante Elastica[N/m]');
zlabel('Aceleracao 3');

