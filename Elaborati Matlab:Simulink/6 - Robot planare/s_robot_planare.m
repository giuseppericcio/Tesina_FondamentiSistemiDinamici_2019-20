
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Simula un robot planare controllato                        %%%
%%% per "tagliare" un triangolo, il logo della FERRARI,        %%% 
%%% un albero di Natale, il cuore                              %%%
%%% con diversi valori della tauf e/o della velocità di taglio %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano -- modificato da GIUSEPPE RICCIO

clc, clear all, close all

warning off

global B0 B1 M L LG 

% Dati del robot

n=2; %numero bracci
Lb1=0.3;m1=7;M1m=0;M1p=0.5;I1m=0;I1p=0;
Lb2=0.4;m2=5;M2m=0;M2p=0.5;I2m=0;I2p=0;

% Traiettorie desiderate:

% Triangolo
tr=0;if tr==1
TT=[0 5 10 20]';
XT=[.2 .45 .45 .2]';
YT=[0.1 0.1 .3 0.1]';
TF=TT(end);
end

% Cognome RICCIO
lo=1;if lo==1
fs=100; % fattore di scala
x0=30;y0=0; % coordinate del punto di partenza

XT=[10 7.05 7 5 5 11.01 11.01 9 12.02 10 13.07 13.13 15 15 13.07 13.18 13.13 14.82 ...
    14.92 13.18 17.04 17.04 21.42 21.42 18.46 18.36 21.63 21.53 17.04 23.96 23.96 ...
    28.66 28.6 25.59 25.54 29.03 28.92 23.96 31.46 31.25 33.1 33.2 31.46 31.46 ...
    31.51 33.52 33.31 31.46 35 35 40 40 35]/fs;

YT=[15 20.02 14.9 15 25 24.99 20.02 19.92 14.9 15 24.99 15.32 15 25 24.99 28.21 ...
    26.95 26.95 28.48 28.21 24.88 14.9 14.95 16.8 16.91 23.19 23.19 24.99 24.88 ...
    25.04 15.01 15.06 16.7 16.7 23.56 23.56 25.1 25.04 25.15 14.69 14.74 24.99 ...
    25.15 27.9 26.47 26.58 28.16 27.9 25 15 15 25 25]/fs;

XT=XT'-XT(1)+x0/fs;YT=YT'-YT(1)+y0/fs; % traslazione

% Calcolo delle lunghezze dei lati del contorno
dl=[];for i=2:length(XT);dl=[dl sqrt((XT(i)-XT(i-1))^2+(YT(i)-YT(i-1))^2)];end
% Calcolo di TT nell'ipotesi di velocità costante pari a sum(dl)/TF
TF=60;
TT=0;for i=1:length(dl);TT=[TT TT(end)+dl(i)];end;TT=TT'*TF/TT(end);
end

% Albero di Natale
al=0;if al==1
fs=100; % fattore di scala
x0=30;y0=0; % coordinate del punto di partenza

XT=[0 2.50 4.00 1.00 1.00 10.00 1.00 8.50 1.00 7.50 0 0 2.00 1.00 2.20 0.70 ...
    0 -0.70 -2.20 -1.00 -2.00 0 0 -7.50 -1.00 -8.50 -1.00 -10.00 -1.00 -1.00 -4.00 -2.50 0]/fs;

YT=[0 0 5.00 5.00 9.50 8.00 14.00 12.50 18.00 16.00 22.50 24.50 23.50 25.40 26.70 26.70 ...
    28.80 26.70 26.70 25.40 23.50 24.50 22.50 16.00 18.00 12.50 14.00 8.00 9.50 5.00 5.00 0 0]/fs;

XT=XT'-XT(1)+x0/fs;YT=YT'-YT(1)+y0/fs; % traslazione

% Calcolo delle lunghezze dei lati del contorno
dl=[];for i=2:length(XT);dl=[dl sqrt((XT(i)-XT(i-1))^2+(YT(i)-YT(i-1))^2)];end
% Calcolo di TT nell'ipotesi di velocità costante pari a sum(dl)/TF
TF=60;
TT=0;for i=1:length(dl);TT=[TT TT(end)+dl(i)];end;TT=TT'*TF/TT(end);
end

% Cuore
cu=0;if cu==1
fs=100; % fattore di scala
x0=25;y0=0; % coordinate del punto di partenza

XT=[-0.06 1.41 2.64 3.07 2.92 2.42 1.53 0.15 -1.15 -1.85 -2.15 -2.81 -3.76 ...
    -5.17 -6.19 -6.56 -6.54 -5.92 -4.71 -2.45 -0.06]/fs;

YT=[0.24 2.45 4.85 6.52 8.03 8.93 9.73 10.08 9.53 8.82 8.02 8.56 8.83 8.66 ...
    7.66 6.52 5.49 4.11 2.88 1.41 0.24]/fs;

XT=XT'-XT(1)+x0/fs;YT=YT'-YT(1)+y0/fs; % traslazione

% Calcolo delle lunghezze dei lati del contorno
dl=[];for i=2:length(XT);dl=[dl sqrt((XT(i)-XT(i-1))^2+(YT(i)-YT(i-1))^2)];end
% Calcolo di TT nell'ipotesi di velocità costante pari a sum(dl)/TF
TF=60;
TT=0;for i=1:length(dl);TT=[TT TT(end)+dl(i)];end;TT=TT'*TF/TT(end);
end

XY=[min(XT)-.05 max(XT)+.05 min(YT)-.05 max(YT)+.05];
figure(1),plot(XT,YT),axis('equal'),axis(XY),title('Traiettoria desiderata nello spazio X - Y'),pause

% Inversione cinematica (Calcolo di bet1r,beta2r)

sim('xTyTbeta1beta2')

figure(2)
plot(beta1r,beta2r),title('Traiettoria desiderata nello spazio \beta_1_r - \beta_2_r')
pause
figure(3)
plot(tt,beta1r,tt,beta2r),grid,legend('\beta_1_r','\beta_2_r'),xlabel('t[s]')
pause

% Calcolo dei parametri del modello

M=zeros(1,n);
I=zeros(1,n);

L=[Lb1 Lb2];
m=[m1 m2];
MM=[M1m M2m];
MP=[M1p M2p];
IM=[I1m I2m];
IP=[I1p I2p];

for i=1:n
M(i)=MM(i)+m(i)*L(i)+MP(i);
I(i)=IM(i)+IP(i)+m(i)*L(i)^3/3+MP(i)*L(i)^2;
LG(i)=(m(i)*L(i)^2/2+MP(i)*L(i))/M(i);
end

B0=[I(1)+I(2)+M(2)*L(1)^2 I(2);I(2) I(2)];
B1=[2*M(2)*L(1)*LG(2) M(2)*L(1)*LG(2);M(2)*L(1)*LG(2) 0];

% Progetto dei controllori PD

beta2=linspace(min(beta2r)*1.2,max(beta2r)*1.2,101);
%beta2=linspace(-pi,pi,101);
Lm=[];LM=[];
r2m=min(beta2);r2M=max(beta2);
bet2=linspace(r2m,r2M,51);
for k=1:length(bet2)
B=B0+B1*cos(bet2(k));l=eig(B);
Lm=[Lm min(l)];LM=[LM max(l)];
end
lm=min(Lm);lM=max(LM);

h=lM;
a=10;

kp1=h*2*a^2;    % Azione proporzionale
kp2=h*2*a^2;
kd1=h*2*a;      % Azione derivativa
kd2=h*2*a;

beta10=beta1r(1);beta20=beta2r(1);

% Simulazione del robot controllato

tauf=.05;Tf=TF+tauf;
sim('robot_planare')

% Stampa dei risultati

L1=Lb1;L2=Lb2;

figure(4)
plot(t,[u1 u2]),title(['Coppie applicate ai giunti con \tau_f=',num2str(tauf)])
grid, xlabel('sec'), ylabel('Nm')
pause

xx=L1*cos(beta1)+L2*cos(beta1+beta2);
yy=L1*sin(beta1)+L2*sin(beta1+beta2);

figure(5)
plot(XT,YT,Xf,Yf,xx,yy),axis('equal'),axis(XY),xlabel('m'),ylabel('m')
legend('Traiettoria originale','Traiettoria filtrata con \tau_f=',num2str(tauf),'Traiettoria tracciata')
title(['Traiettoria tracciata in ',num2str(TF),'sec'])
pause

%%% Produce l'animazione del robot

np=length(t);p=round(np/100);

xx1=L1*cos(beta1);
yy1=L1*sin(beta1);

XaYa=[min([xx1;xx;0])-.05 max([xx1;xx;0])+.05 min([yy1;yy;0])-.05 max([yy1;yy;0])+.05];

figure(6), hold on, axis('equal'), axis(XaYa)
for i=1:p:np
plot([0 xx1(i)],[0 yy1(i)],'y');
plot([xx1(i) xx(i)],[yy1(i) yy(i)],'y',xx(1:i),yy(1:i),'m');
plot(0,0,'om',0,0,'.m',xx1(i),yy1(i),'.m',xx(i),yy(i),'om')
pause(.075)
end

figure(7)
comet(xx,yy)
pause

%%%%%%%%%%%%

tauf=.5;Tf=TF+tauf;
sim('robot_planare')

% Stampa dei risultati

figure(8)
plot(t,[u1 u2]),title(['Coppie applicate ai giunti con \tau_f=',num2str(tauf)])
grid, xlabel('sec'), ylabel('Nm')
pause

xx=L1*cos(beta1)+L2*cos(beta1+beta2);
yy=L1*sin(beta1)+L2*sin(beta1+beta2);

figure(9)
plot(XT,YT,Xf,Yf,xx,yy),axis('equal'),axis(XY),xlabel('m'),ylabel('m')
legend('Traiettoria originale','Traiettoria filtrata con \tau_f=',num2str(tauf),'Traiettoria tracciata')
title(['Traiettoria tracciata in ',num2str(TF),'sec'])
pause

%%% Produce l'animazione del robot

np=length(t);p=round(np/100);

xx1=L1*cos(beta1);
yy1=L1*sin(beta1);

XaYa=[min([xx1;xx;0])-.05 max([xx1;xx;0])+.05 min([yy1;yy;0])-.05 max([yy1;yy;0])+.05];

figure(10), hold on, axis('equal'), axis(XaYa)
for i=1:p:np
plot([0 xx1(i)],[0 yy1(i)],'y');
plot([xx1(i) xx(i)],[yy1(i) yy(i)],'y',xx(1:i),yy(1:i),'m');
plot(0,0,'om',0,0,'.m',xx1(i),yy1(i),'.m')
pause(.075)
end
pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calcolo di TT nell'ipotesi di velocità doppia %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

TF=60/2;
TT=TT*TF/TT(end);
sim('xTyTbeta1beta2')

tauf=.05;Tf=TF+tauf;
sim('robot_planare')

% Stampa dei risultati

figure(11)
plot(t,[u1 u2]),title(['Coppie applicate ai giunti con \tau_f=',num2str(tauf)])
grid, xlabel('sec'), ylabel('Nm')
pause

xx=L1*cos(beta1)+L2*cos(beta1+beta2);
yy=L1*sin(beta1)+L2*sin(beta1+beta2);

figure(12)
plot(XT,YT,Xf,Yf,xx,yy),axis('equal'),axis(XY),xlabel('m'),ylabel('m')
legend('Traiettoria originale','Traiettoria filtrata con \tau_f=',num2str(tauf),'Traiettoria tracciata')
title(['Traiettoria tracciata in ',num2str(TF),'sec'])
pause

%%% Produce l'animazione del robot

np=length(t);p=round(np/100);

xx1=L1*cos(beta1);
yy1=L1*sin(beta1);

XaYa=[min([xx1;xx;0])-.05 max([xx1;xx;0])+.05 min([yy1;yy;0])-.05 max([yy1;yy;0])+.05];

figure(13), hold on, axis('equal'), axis(XaYa)
for i=1:p:np
plot([0 xx1(i)],[0 yy1(i)],'y');
plot([xx1(i) xx(i)],[yy1(i) yy(i)],'y',xx(1:i),yy(1:i),'m');
plot(0,0,'om',0,0,'.m',xx1(i),yy1(i),'.m')
pause(.075)
end

