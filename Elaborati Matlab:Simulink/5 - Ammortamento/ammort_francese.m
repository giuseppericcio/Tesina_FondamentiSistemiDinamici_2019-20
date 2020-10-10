
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Calcola il piano di ammortamento alla francese di un mutuo a tasso fisso %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano - modificato da GIUSEPPE RICCIO

clc, close all, clear all

disp('Piano di ammortamento alla francese')
disp(' ')
deb=input('Importo da rateizzare ='); %DEBITO INSERITO IN INPUT
i=input('Tasso di interesse annuo =');
nra=input('Numero di rate annue =');
dma=input('Durata del mutuo in anni =');

N=nra*dma; % NUMERO RATE
ip=i/100/nra; % INTERESSE SUL PERIODO

A=1;B=-1;C=A;D=B; %MATRICI DEL MODELLO I-S-U

ro=(1+1/((1+ip)^(N)-1))*deb*ip; %CALCOLO RATA INIZIALE
xo=deb;

K=1:N;
u=K*0+ro; %VETTORE DELLE RATE DEL MUTUO
y=dlsim(A,B,C,D,u,xo);
close
tot=sum(u)/1000;
ra=tot/N;

K=[0 K]*12/nra;
y=[deb;y];
y(N+1)=round(y(N+1));
subplot(2,1,1)
plot(K,y/1000,'.k','LineWidth',2),grid,
title(['Andamento del debito se i=',num2str(i),'% - Rata=', num2str(round(ra*1000)/1000),...
     ' migliaia di Euro - Somma totale pagata=',num2str(round(tot*1000)/1000),' migliaia di Euro'])
xlabel('Tempo in mesi'), ylabel('Debito in migliaia di Euro')

y1=y;
i1=i;

i=2*i;      % TASSO DI INTERESSE DOPPIO
ip=i/100/nra;

A=1;B=-1;C=A;D=B;

ro=(1+1/((1+ip)^(N)-1))*deb*ip;
xo=deb;

K=1:N;
u=K*0+ro;
y=dlsim(A,B,C,D,u,xo);
tot=sum(u)/1000;
ra=tot/N;

K=[0 K]*12/nra;
y=[deb;y];
y(N+1)=round(y(N+1));
subplot(2,1,2)
plot(K,y1/1000,'.k',K,y/1000,'.r','LineWidth',2),legend('i','2i'),grid,
title(['Andamento del debito se i=',num2str(i),'% - Rata=', num2str(round(ra*1000)/1000),...
     ' migliaia di Euro - Somma totale pagata=',num2str(round(tot*1000)/1000),' migliaia di Euro'])
xlabel('Tempo in mesi'), ylabel('Debito in migliaia di Euro')
