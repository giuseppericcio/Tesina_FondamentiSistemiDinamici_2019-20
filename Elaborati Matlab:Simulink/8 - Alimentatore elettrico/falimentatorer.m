
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Function falimentatorer.m dello schema simulink alimentatorer.mdl %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano

function Y=falimentatorer(U)

u=U(1);
x1=U(2);
x2=U(3);
Rg=U(4);
C=U(5);
L=U(6);
R=U(7);

Vd=[-20 -10 0 1 5 10 20];
Id=[-.5 -.2 0 2 30 90 300];

%close, plot(Vd,Id),grid, title('Caratteristica del diodo'),xlabel('Tensione'), ylabel('Corrente'),pause

Vdg=Vd+Rg*Id;

vdg=u-x1;
id=interp1(Vdg,Id,vdg);
x1p=(id-x2)/C;
Vu=R*x2;
x2p=(x1-Vu)/L;

Ii=id;
Iu=x2;

Y=[Vu Ii Iu x1p x2p];

