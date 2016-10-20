function [features] = getFeatures(imagePath, N)
    N = N + 1; % Increment N to get the frequncy from 0 to 3.
    features = [];
    im = imread(imagePath);
    im = logical(im);     
    c = chainCode(im);
    angles = c(3,:)*(2*pi/8);
    anglesFFT = fft(angles); %fast fourier transform
    filter = zeros(size(angles)); 
    filter(1:N) = 1; 
    filter(end-N+2:end) = 1;
    filteredFFT = anglesFFT .* filter; % Apply the filter by scalar multipliacation
    featureVector = abs(filteredFFT);
    featureVector = featureVector(1,2:N); % discard zero frequency.
    features      = vertcat(features,featureVector);



end