%% Specify the parameters
% This defines the square around the origin (0, 0) in which the proability
% densities will be calculated
L = 10;
mu = [3;-2.4]; % the mean (a point in 2D)
theta = 30*pi/180; % rotation angle (which specifies the eigenvectors)
% These are actually eigenvalues
scale1 = 3;
scale2 = 1;
%% Calculate the covariance matrix
% Effectively we use a matrix C to rotate the point [x y], scale it, and then
% rotate it back
% R performs the rotation, remember R? = inv(R), and S the scaling
R = [cos(theta) -sin(theta); sin(theta) cos(theta)]; % rotation matrix
S = [scale1 0; 0 scale2]; % scale matrix, a diagonal matrix
C = R*S*R'; % the covariance
%% Calculate the probability distribution
X = -L:L; % vector of x locations
Y = -L:L; % vector of y locations
probG = zeros( 2*L+1, 2*L+1 ); % an array to hold the Gaussian distribution
%probability values
K = 1/(2*pi*sqrt(det(C))); % a constant
for j = 1:length(Y)
for i = 1:length(X)
x = X(i) - mu(1);
y = Y(j) - mu(2);
probG(j,i) = K*exp( -0.5* [x y] * inv(C) * [x; y] );
end
end
%% Plot it in 3D
figure
surf( probG );
% All going well, this should sum to 1.0
sum(probG(:))