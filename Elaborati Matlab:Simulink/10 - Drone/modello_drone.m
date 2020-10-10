
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Modello drone per studenti     %%
%% dx/dt=Ax+[B E G]*[u;d;g];y=Cx; %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% G. & L. Celentano

clc, close all, clear all

Mmax=2,Mn=1.8
M=1.9,Kax=1,Kay=1.2
A=[0 0 1 0;0 0 0 1;0 0 -Kax/M 0;0 0 0 -Kay/M];
B=[0 0;0 0;1/M 0;0 1/M];
E=[0 0;0 0; Kax/M 0;0 Kay/M];
G=[0 0 0 -1]';
C=[1 0 0 0;0 1 0 0];
D=zeros(2,5);
