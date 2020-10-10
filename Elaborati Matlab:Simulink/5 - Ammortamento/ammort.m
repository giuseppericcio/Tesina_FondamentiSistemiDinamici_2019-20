
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Calcola il piano di ammortamento di un mutuo a tasso fisso %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano

clc, close all, clear all

disp(' ')
i=input('Tasso di interesse annuo =');
nra=input('Numero di rate annue =');
dma=input('Durata del mutuo in anni =');

deb=50000;      % ammontare mutuo
N=nra*dma;       % numero rate

A=1+i/100/nra;B=-1;C=A;D=B;

ro=i/100/nra/(1-A^(-N))*deb;
xo=deb;

K=1:N;
u=K*0+ro;
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

i=2*i;      % Tasso di interesse doppio

A=1+i/100/nra;B=-1;C=A;D=B;

ro=i/100/nra/(1-A^(-N))*deb;
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
