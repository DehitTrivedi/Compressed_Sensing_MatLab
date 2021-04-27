% Solve y = Theta * s for "s"
n = 1000; % dimension of s
p = 200; % number of measurements, dim(y) 
Theta = randn(p,n);
y = randn(p,1);
% L1 minimum norm solution s_L1
cvx_begin;
    variable s_L1(n);
    minimize( norm(s_L1,1) );
    subject to
    Theta*s_L1 == y;
cvx_end;
  
s_L2 = pinv(Theta)*y;%l2norm 

figure();
subplot(221)
plot(s_L1);
title('L1-norm');
subplot(222)
[hc,h] = hist(s_L1,[-0.1:0.01:0.1]);
bar(h,hc);
title('L1-norm');
subplot(223)
plot(s_L2,'r');
title('L2-norm');
subplot(224)
[hs,h2] = hist(s_L2,[-0.1:0.01:0.1]);
bar(h2,hs,'r');
title('L2-norm');
