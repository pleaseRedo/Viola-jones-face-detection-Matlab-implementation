% A program to demonstrate Fourier analysis
clear;
close all;
%%Start by creating a signal to analyse using the synthesis
num_freq = 5;
amp = [1 2 1 1 0.5];
phs = [0.5 1 0 1.5 1];
%calculate frequencies
freq = 2*pi*(1:num_freq);
%Sample along x
dx = 0.001;
x = 0:dx:1;
y = zeros(size(x));
%Sum each sine wave
for i = 1:num_freq
y = y + amp(i) * sin(x*freq(i) + phs(i));
end
%% Fourier Analsyis
for i = 1:num_freq
    
    a(i) = sum(y.*cos(freq(i).*x))*dx;% your code here
    b(i) = sum(y.*sin(freq(i).*x))*dx;% your code here
end
famp = sqrt(a.^2 + b.^2);% your code here % recovered amplitues, up to a scale factor:
famp = 2*famp; % recovered amplitude
fphs = atan(a./b);% your code here % recovered phase
% Output

famp
fphs
%plot(x,y);