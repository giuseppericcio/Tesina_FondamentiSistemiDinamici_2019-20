
%% Function frobot.m per lo schema simulink robot_planare.mdl
%% Calcola l'equazione di stato del robot

%% Autori: G. e L. Celentano

function v=frobot(u)

global B0 B1 M L LG 

cg=0; %cg=1 presenza di gravità; cg=0 assenza o compensazione della gravità
U=u(1:2);
q=u(3:4);qp=u(5:6);
g=9.81;
c1=cos(q(1));c12=cos(q(1)+q(2));
c2=cos(q(2));s2=sin(q(2));

B=B0+B1*c2;
Cc=M(2)*L(1)*LG(2)*s2*[2*qp(1)*qp(2)+qp(2)^2;-qp(1)^2];
Cg=-g*[M(1)*LG(1)*c1+M(2)*(L(1)*c1+LG(2)*c12);M(2)*LG(2)*c12];

qpp=inv(B)*(Cc+Cg*cg+U);

v=[qp;qpp];


