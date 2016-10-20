dx = 0.1;
x = -15 : dx : 15;
mu = 5;
C = 2^2;
px_gauss = exp( -0.5*(x-mu) .* C^(-1) .* (x-mu) ) / (sqrt(2*pi)*sqrt(C));
s = sum( px_gauss * dx );
figure;
plot( x, px_gauss );