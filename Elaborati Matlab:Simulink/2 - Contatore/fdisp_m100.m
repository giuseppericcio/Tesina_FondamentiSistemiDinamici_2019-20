%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Visualizza un numero intero modulo 100 %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% G. e L. Celentano -- modificato da GIUSEPPE RICCIO

function v=fdisp_m100(n)

warning off

n=abs(n);

if n>99
sound(sin(2*pi*500*[0:1/5e3:1]),5e3)
disp(' ')
disp('Valore assoluto del numero maggiore di 99')
end

n100=mod(n,100);

if n100==0,close all;end

cc=[floor(n100./10) mod(n100,10)];
CC=[];

for i=1:2
n=cc(i);

if n==0
% zero
a=ones(600,450);a(30:570,30:420)=a(30:570,30:420)-1;
a(110:490,110:340)=a(110:490,110:340)+1;
CC=[CC a];
end
    
if n==1
a=ones(600,450);a(30:570,200:280)=a(30:570,200:280)-1;
a(30:110,170:200)=a(30:110,170:200)-1;
CC=[CC a];
end

if n==2
% due
a=ones(600,450);a(30:570,30:420)=a(30:570,30:420)-1;
a(110:490,110:340)=a(110:490,110:340)+1;
a(260:340,110:340)=a(260:340,110:340)-1;
a(111:259,30:110)=a(111:259,30:110)+1;
a(341:490,340:420)=a(341:490,340:420)+1;
CC=[CC a];
end

if n==3
% tre
a=ones(600,450);a(30:570,30:420)=a(30:570,30:420)-1;
a(110:490,110:340)=a(110:490,110:340)+1;
a(260:340,110:340)=a(260:340,110:340)-1;
a(111:259,30:110)=a(111:259,30:110)+1;
a(341:490,30:110)=a(341:490,30:110)+1;
CC=[CC a];
end

if n==4
% quattro
a=ones(600,450);a(30:570,30:420)=a(30:570,30:420)-1;
a(110:490,110:340)=a(110:490,110:340)+1;
a(260:340,110:340)=a(260:340,110:340)-1;
a(30:110,110:340)=a(30:110,110:340)+1;
a(490:570,110:340)=a(490:570,110:340)+1;
a(341:570,30:110)=a(341:570,30:110)+1;
CC=[CC a];
end

if n==5
% cinque
a=ones(600,450);a(30:570,30:420)=a(30:570,30:420)-1;
a(110:490,110:340)=a(110:490,110:340)+1;
a(260:340,110:340)=a(260:340,110:340)-1;
a(111:259,340:420)=a(111:259,340:420)+1;
a(341:490,30:110)=a(341:490,30:110)+1;
CC=[CC a];
end

if n==6
% sei
a=ones(600,450);a(30:570,30:420)=a(30:570,30:420)-1;
a(110:490,110:340)=a(110:490,110:340)+1;
a(260:340,110:340)=a(260:340,110:340)-1;
a(111:259,340:420)=a(111:259,340:420)+1;
CC=[CC a];
end
    
if n==7
% sette
a=ones(600,450);a(30:570,340:420)=a(30:570,340:420)-1;
a(30:110,30:360)=a(30:110,30:360)-1;
CC=[CC a];
end

if n==8
% otto
a=ones(600,450);a(30:570,30:420)=a(30:570,30:420)-1;
a(110:490,110:340)=a(110:490,110:340)+1;
a(260:340,110:340)=a(260:340,110:340)-1;
CC=[CC a];
end

if n==9
% nove
a=ones(600,450);a(30:570,30:420)=a(30:570,30:420)-1;
a(110:490,110:340)=a(110:490,110:340)+1;
a(260:340,110:340)=a(260:340,110:340)-1;
a(341:490,30:110)=a(341:490,30:110)+1;
CC=[CC a];
end
end

imshow(CC)
%pause(1)
v=n100;
end