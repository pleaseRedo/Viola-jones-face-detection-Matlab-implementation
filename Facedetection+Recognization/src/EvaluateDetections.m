% EvaluateDetections.m 

function EvaluateDetections(imc, template, maxPos, numDetections)

[nRows, nCols, nBands] = size(imc);

% Create binary image for Viola-Jones detections
vjIm = zeros(nRows, nCols);
load('../data/vjrects.mat', 'rects');
nRects = size(rects, 1);
for i = 1:nRects
    vjIm(rects(i, 1):rects(i, 3), rects(i, 2):rects(i, 4)) = 1;
end;

% Create binary image for our detections
detIm = zeros(nRows, nCols);

figure; imshow(imc);
boxRows = size(template, 1);
boxCols = size(template, 2);

styleStr = {'LineWidth', 2};
for i = 1:numDetections
    rowi = maxPos(1, i);
    coli = maxPos(2, i);    
    
    r0 = floor((rowi-boxRows/2)+0.5);
    r1 = floor((rowi+boxRows/2)+0.5);
    c0 = floor((coli-boxCols/2)+0.5);
    c1 = floor((coli+boxCols/2)+0.5);
    
    r0 = max(1, min(nRows, r0));
    r1 = max(1, min(nRows, r1));
    c0 = max(1, min(nCols, c0));
    c1 = max(1, min(nCols, c1));

    DrawRectangle(r0, c0, r1, c1, styleStr);
    detIm(r0:r1, c0:c1) = 1;
end;

% Calculate percentage overlap with Viola-Jones detections
overlap = 100 * sum(sum(detIm .* vjIm)) / (max(sum(detIm(:)), sum(vjIm(:)))); 
disp(sprintf('  %.2f%% overlap with Viola-Jones detections', overlap));

