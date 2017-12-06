% FaceDetect.m

% Read source image 
disp('[ Reading source image ]');
imc = double(imread('../data/g20.jpg'))/255;

% Extract features from image
disp('[ Extracting features ]');
imf = mean(imc, 3); % greyscale image for now

% Select a region for template matching
selectRegion = 0;
disp('[ Selecting template region ]');
if (selectRegion)
    fh = figure;imshow(imc);
    rect = floor(getrect);
    template = imf(rect(2):(rect(2)+rect(4)-1), rect(1):(rect(1)+rect(3)-1), :);
    %template = template - mean(template(:));
    close(fh);
else
% use fixed image
    imt = double(imread('../data/obama.png'))/255;

    imt = imresize(imt, [33 33]);
    template = mean(imt, 3); % greyscale image for now
    %template = template - mean(template(:));
end;

% Compute normalised correlation of template with image
disp('[ Filtering with template ]');

% just use the image for now
%resp = imf;
% TODO: implement the following function
resp=[];
 %resp = NormalisedCorrelation(imf, template);
% 
 [imRows,imCols,nBands] = size(imf);

  dotProd = zeros(imRows,imCols);
  for i = 1:nBands


      dotProdi = filter2(template(:,:,i),imf(:,:,i),'same');
      dotProd = dotProd + dotProdi;

  end;
 %figure;imshow(dotProd);
 resp = dotProd;
% Find local maxima with non-max suppression 
disp('[ Find local maxima ]');
suppDst = 10;
[maxVal, maxPos] = FindLocalMaxima(resp, suppDst);

% Display and evaluate detections
disp('[ Evaluate detections ]');
numDetections = 50;
EvaluateDetections(imc, template, maxPos, numDetections);
