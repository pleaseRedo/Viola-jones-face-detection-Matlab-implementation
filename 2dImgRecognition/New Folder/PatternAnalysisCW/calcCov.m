function covMat = calcCov(dataMatrix)
    dataNum                = size(dataMatrix,1);
    oneOneM                = ones(dataNum);
    myDeviation            = dataMatrix - (oneOneM * dataMatrix / dataNum);
    covMat                 = transpose(myDeviation) * myDeviation / dataNum;
end
