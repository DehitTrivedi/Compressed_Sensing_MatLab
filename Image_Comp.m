%Compressed sensing for images
clc;clear all; close all;

Img = imread('stairs.jpeg');
Img = Img([50:99],[50:99]);
x = double(Img(:));
n = length(x);

m = 250;
Phi = randn(m,n);
y = Phi*x;

Theta = zeros(m,n);
for ii = 1:n
    ek = zeros(1,n);
    ek(ii) = 1;
    psi = idct(ek)';
    Theta(:,ii) = Phi*psi;
end

s2 = pinv(Theta)*y;

%l1 NORM
cvx_begin;
    variable s1(n);
    minimize(norm(s1,1));
    subject to
        Theta*s1 == y;
cvx_end;


x2 = zeros(n,1);
for ii = 1:n
    ek = zeros(1,n);
    ek(ii) = 1;
    psi = idct(ek)';
    x2 = x2+psi*s2(ii);
end

x1 = zeros(n,1);
for ii = 1:n
    ek = zeros(1,n);
    ek(ii) = 1;
    psi = idct(ek)';
    x1 = x1+psi*s1(ii);
end

%Display 
figure('name','Compressive sensing image reconstructions')
subplot(1,3,1), imagesc(reshape(x,50,50)), xlabel('original'), axis image
subplot(1,3,2), imagesc(reshape(x2,50,50)), xlabel('L2-NORM'), axis image
subplot(1,3,3), imagesc(reshape(x1,50,50)), xlabel('L1-NORM'), axis image
colormap gray

