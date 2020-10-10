
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Function tra_inv.m  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano

function v=tra_inv(u)

xT=u(1);
yT=u(2);
L1=u(3);
L2=u(4);

beta2=acos((xT^2+yT^2-L1^2-L2^2)/(2*L1*L2));
beta1=atan2(yT,xT)-atan2(L2*sin(beta2),(L1+L2*cos(beta2)));

v=[beta1; beta2];

end
