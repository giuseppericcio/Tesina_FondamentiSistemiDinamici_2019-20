
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Simula un trasformatore per diverse tensioni di ingresso %%%
%%% e determina la risposta in frequenza                     %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano -- modificato da GIUSEPPE RICCIO

clc, close all, clear all

R1=2;L1=5;
R2=0.025;L2=0.0595;
M=0.97*sqrt(L1*L2);
n=L1/M;
R0=5e3;

RL=2.5;

P=[R1*L1/R0+L1 R1*M/R0+M; M L2];
Q=[-R1 0;0 -R2-RL];
R=[1 0 ]';

Pi=inv(P);
A=Pi*Q;B=Pi*R;
C=[0 -RL;1 0;0 1];D=[0 0 0]';
x0=zeros(2,1);

i=1;tf=.1;
sim('trasformatore')

figure(1)
subplot(2,1,1)
plot(t,v1),legend('v_1'),grid,title(['v_1=sqrt(2)220sin(2\pi50t+\pi/4),  M>0'])
subplot(2,1,2)
plot(t,v2),legend('v_2'),grid,xlabel('t[s]')
pause
figure(2)
subplot(2,1,1)
plot(t,i1),legend('i_1'),grid,title(['v_1=sqrt(2)220sin(2\pi50t+\pi/4),  M>0'])
subplot(2,1,2)
plot(t,i2),legend('i_2'),grid,xlabel('t[s]')
pause

i=2;tf=10;
sim('trasformatore')

figure(3)
subplot(2,1,1)
plot(t,v1),legend('v_1'),grid
subplot(2,1,2)
plot(t,v2),legend('v_2'),grid,xlabel('t[s]')
pause

i=3;tf=10;
sim('trasformatore')

figure(4)
subplot(2,1,1)
plot(t,v1),legend('v_1'),grid
subplot(2,1,2)
plot(t,v2),legend('v_2'),grid,xlabel('t[s]')
pause

%%% M<0 %%%%
M=-M;

P=[R1*L1/R0+L1 R1*M/R0+M; M L2];
Q=[-R1 0;0 -R2-RL];
R=[1 0 ]';

Pi=inv(P);
A=Pi*Q;B=Pi*R;
C=[0 -RL;1 0;0 1];D=[0 0 0]';
x0=zeros(2,1);

i=1;tf=.1;
sim('trasformatore')

figure(5)
subplot(2,1,1)
plot(t,v1),legend('v_1'),grid,title(['v_1=sqrt(2)220sin(2\pi50t+\pi/4),  M<0'])
subplot(2,1,2)
plot(t,v2),legend('v_2'),grid,xlabel('t[s]')
pause
figure(6)
subplot(2,1,1)
plot(t,i1),legend('i_1'),grid,title(['v_1=sqrt(2)220sin(2\pi50t+\pi/4),  M<0'])
subplot(2,1,2)
plot(t,i2),legend('i_2'),grid,xlabel('t[s]')
pause

f=logspace(-2,3,1e3);[M F]=bode(A,B,C(1,:),0,1,2*pi*f);
figure(7)
semilogx(f,M,f,f*0+1/n,'r'),grid,xlabel('f[Hz]'),ylabel('V_2/V_1')
pause
