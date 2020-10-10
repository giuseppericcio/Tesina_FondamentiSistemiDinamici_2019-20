
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Simula il forno mediante lo schema simulink forno.mdl %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano

clc, clear all, close all

Gc=10;Gf=10;
Cc=1e3;Cf=1e3;

A=[-(Gc+Gf)/Cf Gc/Cf;Gc/Cc -Gc/Cc];
B=[1/Cf Gf/Cf;0 0];
C=eye(2);D=zeros(2,2);
%break

C=[0 1];D=[0 0];
Kp=.4;
Ki=.45;
Ac=[A(1,1) A(1,2)-Kp/Cf Ki/Cf;A(2,1) A(2,2) 0;0 -1 0];
pc=poly(Ac);
[num den]=ss2tf(A,B(:,1),C, 0);
pcl=[1 den(2) num(3)*Kp+den(3) num(3)*Ki]; 
pc2=[1  (Gc+Gf)/Cf+Gc/Cc Gc*(Gf+Kp)/Cc/Cf  Ki*Gc/Cc/Cf];
disp('Poli:'),p=roots(pc2)
pause
%break

t=linspace(0,1800,1800);
x0=[200 200]'/100;
y=lsim(ss(A,B,eye(2),zeros(2,2)),[t'*0+2000 t'*0],t,x0);

figure(1)
plot(t,y(:,1),t,y(:,2)),grid,xlabel('s'),ylabel('°C'),legend('\theta forno','\theta corpo')
title('Forno con controllore PI')
pause

C=eye(2);D=zeros(2,2);
sim('forno')

figure(2)
eps=5;plot(t,r,'g',t,r-eps,'--r',t,r+eps,'r',t,yc,'k',t,yf,'--k',t,d,'b')
grid,xlabel('t[s]'),ylabel('°C'),legend('r','r-\epsilon','r+\epsilon','y_c','y_f','d')
pause
%break

figure(3)
subplot(2,1,1)
plot(t,r,'g',t,yc,'k',t,yf,'--k',t,d,'b')
grid,xlabel('t[s]'),ylabel('°C'),legend('r','y_c','y_f','d')
subplot(2,1,2)
plot(t,u/1e3)
grid,xlabel('t[s]'),ylabel('kW'),legend('u'),axis([0 t(end) -.500 3.000])
