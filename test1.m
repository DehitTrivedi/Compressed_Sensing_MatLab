%Image learning
clc;clear all;close all;

X = imread('stairs.jpeg');
x_gray = rgb2gray(X);
figure(1);
imshow(x_gray);
title('image');

Xf = fft2(x_gray);
phase = angle(fftshift(Xf));
F = log(abs(fftshift(Xf))+1); 

figure(2);
imshow(phase,[]);
title('phase');
figure(3);
imshow(mat2gray(F),[]);
title('Mag-fftshift');
figure(4);
imshow(Xf);
title('Mag');


