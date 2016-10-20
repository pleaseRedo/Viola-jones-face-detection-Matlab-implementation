function covMat = calcCov(dataMatrix)
    dataNum                = length(dataMatrix);
    myIdentityM            = ones(dataNum);
    myDeviation            = dataMatrix - (myIdentityM * dataMatrix / dataNum);
    covMat                 = transpose(myDeviation) * myDeviation / (dataNum - 1);
    
end
