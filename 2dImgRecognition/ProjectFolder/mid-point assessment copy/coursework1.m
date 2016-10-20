clear;
close all;

%Get train directory path
currentPath = pwd;
imagedir = strcat(pwd,'/images/train');
classesName = getClasses(imagedir);

%Generate feature vector
alienFM = getDataMatrix(imagedir,classesName{1},3);
arrowFM = getDataMatrix(imagedir,classesName{2},3);
butterflyFM = getDataMatrix(imagedir,classesName{3},3);
faceFM = getDataMatrix(imagedir,classesName{4},3);
starFM = getDataMatrix(imagedir,classesName{5},3);
toonheadFM = getDataMatrix(imagedir,classesName{6},3);

%% Work out mean and covarianceMatrix

alienMean         = calcMean(alienFM);
alienCovariance   = calcCov(alienFM);


arrowMean         = calcMean(arrowFM);
arrowCovariance   = calcCov(arrowFM);

butterflyMean     = calcMean(butterflyFM);
butterflyCovariance = calcCov(butterflyFM);

faceMean = calcMean(faceFM);
faceCovariance = calcCov(faceFM);

starMean = calcMean(starFM);
starCovariance = calcCov(starFM);

toonheadMean = calcMean(toonheadFM);
toonheadCovariance = calcCov(toonheadFM);
