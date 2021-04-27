%Compressed Sensing for Audio signal
clc;clear all;close all;

%Generating a signal that is to be measured
n = 4096;
f = 1;
fs = 1000;
t = 0:1/fs:4095/fs;

x = sin(2*pi*f*t);
figure();
plot(t,x);
title('The orignal signal');

%Measuring the signal generated 
p = n/32;
c = round(rand(p,1)*n);
y = x(c); %Random measurement of x stored in y

%Compressed Sensing 
Psi = dct(eye(n));
Theta = Psi(c,:);
cvx_begin;
    variable s(n);
    minimize(norm(s,1));
    subject to
        Theta*s == y';
cvx_end;

xrecon = idct(s);

figure();
plot(t,xrecon);