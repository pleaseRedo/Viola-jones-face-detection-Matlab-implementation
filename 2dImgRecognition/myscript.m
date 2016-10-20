% delete all variables from memory
clear all;
%% create N points
N = 100;
ang = 2*pi*(0:N-1)/N;
x = [cos(ang); sin(ang)];
%% visualise
figure;
plot( x(1,:), x(2,:) );