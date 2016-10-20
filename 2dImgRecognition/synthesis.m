% Define a set of frequencies, phases and amplitudes,
num_freq = 6;
%phs = [0 1 2 3 4 5 6 7 8 10];
phs = [0 0 0 0 0 0  ];
%amp = [2 1 5 1/3 3 1/5 4 1/7 7 1/9];
amp = [0 1 0 1/3 0 1/5];
%calculate frequencies
freq = 2*pi*(0:(num_freq-1));
%Sample along x
x = 0:0.01:1;
y = zeros(size(x));
%Sum each sine wave
for i = 1:num_freq
    y = amp(i)*sin(freq(i)*x + phs(i));
%your code here: see equation 2
end
%plot the function
plot(x, y);