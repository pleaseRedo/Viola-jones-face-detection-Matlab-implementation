function [pMu,pPi,pSigma] = initEM(dataMatrix,Components)
    [eleNum, featureNum] = size(dataMatrix);
    tempM = randperm(eleNum);
    pMu = dataMatrix(tempM(1:Components), :);
    pPi = zeros(1, Components);
    pSigma = zeros(featureNum, featureNum, Components); % Covariance 
    
    tempA = sum(dataMatrix.*dataMatrix, 2);
    tempB = sum(pMu.*pMu, 2)';
    sumM = size(dataMatrix);

    for idx = 1:eleNum
        for j = 1:Components 
           sumM(idx,j) =  tempA(idx) + tempB(j);
        end
    end
    
    dMat = sumM - 2*dataMatrix*pMu';
    [~, labels] = min(dMat, [], 2);
    
    for i=1:Components
        Xk = dataMatrix(labels == i, :);
        pPi(i) = size(Xk, 1)/eleNum;
    %    pSigma(:, :, i) =  calcCov(Xk);   

        pSigma(:, :, i)= ensurePSD(calcCov(Xk));
    end
    
end