clc;clear all;close all;

A = imread('stairs.jpeg');
Abw = rgb2gray(A);
figure();
imshow(Abw);

At = fft2(Abw);
F = log(abs(fftshift(At))+1);
figure();
imshow(mat2gray(F),[]);

Bt = sort(abs(At(:)));
keep = 0.05;
thresh = Bt(floor((1-keep)*length(Bt)));
ind = abs(At)>thresh;
Atlow = At.*ind;

Fnew = log(abs(fftshift(Atlow))+1);
figure();
imshow(mat2gray(Fnew),[]);

Alow=uint8(ifft2(Atlow)); 
figure();
imshow(Alow);

