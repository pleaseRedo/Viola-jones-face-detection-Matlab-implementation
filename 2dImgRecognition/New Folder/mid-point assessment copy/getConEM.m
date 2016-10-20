function M = getConEM(imagedir,gmm)
    %M = confusionMatrix(imagedir,'Alien',confusionM);
    confusionM = zeros(6,6);
    M = confusionM;
    classList = getClasses(imagedir);
    for idx = 1:length(classList)

        M = confusionEM(imagedir,char(classList(idx)),M,gmm);
    end
     
    printMatrix(M, 'Confusion Matrix', 'Alien Arrow Butterfly Face Star Toonhead', 'Alien Arrow Butterfly Face Star Toonhead' )
    accuracy = trace(M) / sum(sum(M))
end

