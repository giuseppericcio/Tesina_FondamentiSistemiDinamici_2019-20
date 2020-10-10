
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Function fantifurto.m dello schema simulink antifurto.mdl %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano -- modificato da GIUSEPPE RICCIO

function y=fantifurto(u)

t=0:1e-4:1;s=sin(2*pi*1000*t).*sin(3*pi*t);

if u==1
  for l=1:5
    close
    imshow('Allarme.png');pause(.5);imshow('Allarme2.png')
    sound(s,1e4);pause(1)
 end
else
   close
   imshow('Allarme_Disattivato.png')
end


