%% set up a series of X points to compute sinusoid value "samples"
L = 10;
x = -L:0.1:L;
%% define parallel arrays for frequencies, amplitides and phases
omega = 2*pi/(2*L)*[1 10 1 1];
amp = [1 2 1 3];
phs = 2*pi*[0 1/2 0 1/4];
%% calculate the sinusoids themselves
N = length(omega); % the number of sinusoids
f = zeros( N, length(x) ); % a 2D array to hold them
for i = 1:N
f(i,:) = amp(i)*sin(omega(i)*x + phs(i));
%equation 1: hint use x, amp(i), omega(i) and phs(i)
end
%% visualise the sinusoids

plot(x, f);

