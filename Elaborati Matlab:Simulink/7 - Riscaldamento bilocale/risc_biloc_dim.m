
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Dati e modello di un impianto di riscaldamento di %%%
%%% un villino bilocale                               %%%
%%% Dimensionamento dei condizionatori                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano

clc, clear all, close all

% Dati
C1=1e5;
C2=2e4;
G1=250;
G2=100;
G12=500;

% Modello
A=[-(G1+G12)/C1  G12/C1; G12/C2  -(G2+G12)/C2];
B=[1/C1 0;0 1/C2];
E=[G1/C1;G2/C2];
C=eye(2);D=zeros(2,3);

% Dimensionamento dei radiatori
% u=-inv(B)*[A E]*[y;d]

disp(' ')
dm=-30,dp=25
ym=[16; 16],yp=[24; 24],
pause

K=-inv(B)*[A E];k1=K(1,:);k2=K(2,:);

F=[1 0 0;0 1 0;-1 0 0;0 -1 0;0 0 1;0 0 -1];
g=[yp;-ym;dp;-dm];

z1m=linprog(k1,F,g);u1m=k1*z1m/1e3;
z1p=linprog(-k1,F,g);u1p=k1*z1p/1e3;
z2m=linprog(k2,F,g);u2m=k2*z2m/1e3;
z2p=linprog(-k2,F,g);u2p=k2*z2p/1e3;
disp(' ')
disp('Potenze minime e massime in kW per avere le temperature desiderate')
u1m,u1p
u2m,u2p
pause

%break

% Dimensionamento dei radiatori
% nell'ipotesi di temperature dei locali uguali

K=-inv(B)*[A*[1;1] E];k1=K(1,:);k2=K(2,:);

F=[1 0;-1 0;0 1;0 -1];
g=[yp(1);-ym(1);dp;-dm];

z1m=linprog(k1,F,g);u1m=k1*z1m/1e3;
z1p=linprog(-k1,F,g);u1p=k1*z1p/1e3;
z2m=linprog(k2,F,g);u2m=k2*z2m/1e3;
z2p=linprog(-k2,F,g);u2p=k2*z2p/1e3;
disp(' ')
disp('Potenze minime e massime in kW per avere le temperature desiderate uguali')
u1m,u1p
u2m,u2p
pause

%break

% Simulazione

sim('risc_biloc')

subplot(2,1,1)
plot(t,Dati1(:,2),'k',t,Dati1(:,1),'g',t,Dati1(:,3),'r')
grid,xlabel('t[h]'),legend('\theta_1','\theta_d_1','\theta_a')
subplot(2,1,2)
plot(t,Dati2(:,2),'k',t,Dati2(:,1),'g',t,Dati2(:,3),'r')
grid,xlabel('t[h]'),legend('\theta_2','\theta_d_2','\theta_a')
