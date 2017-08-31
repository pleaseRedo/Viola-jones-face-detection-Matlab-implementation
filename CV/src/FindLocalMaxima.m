% FindLocalMaxima.m

function [maxVal, maxPos] = FindLocalMaxima(resp, suppDst)

% Finds points that are local maxima in a disk of radius suppDst
domain=fspecial('disk',suppDst)>0;
nn = numel(find(domain));
localmax = ordfilt2(resp, nn, domain);
%imwrite(NormaliseImage(localmax), 'localmax.jpg');

% eliminate border
border = 10;
[nRows, nCols] = size(localmax);
localmax(1:border, :) = -1;
localmax((nRows-border+1):nRows, :) = -1;
localmax(:, 1:border) = -1;
localmax(:, (nCols-border+1):nCols) = -1;

maximaIm = (localmax == resp);
%imwrite(NormaliseImage(maximaIm), 'maximaIm.jpg');

[maxRow, maxCol] = find(maximaIm);
maxvals = resp(sub2ind(size(resp), maxRow, maxCol));
[sortVal, sortOrder] = sort(-maxvals);

maxVal = sortVal(sortOrder);
maxPos = [maxRow(sortOrder)'; maxCol(sortOrder)'];
