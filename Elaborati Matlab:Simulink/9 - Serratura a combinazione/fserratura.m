
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Function fserratura.m dello schema simulink serratura.mdl %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Autori: G. e L. Celentano

function y=fserratura(u)

a=zeros(450,400);
a(200:400,120:300)=a(200:400,120:300)+256;
a(50:200,150:170)=a(50:200,150:170)+256;
a(50:70,160:270)=a(50:70,160:270)+256;
a(70:150,250:270)=a(70:150,250:270)+256;

c=a;c(70:200,250:270)=c(70:200,250:270)+256;

s=sin(2*pi*1000*[0:1e-4:1.5]);

if u==2
close
imshow(uint8(a))
for i=1:3;sound(s,1e4);pause(1);end
else
close
imshow(uint8(c))
end

