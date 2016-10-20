function M = getConfusionMatrix(imagedir)
    %M = confusionMatrix(imagedir,'Alien',confusionM);
    confusionM = zeros(6,6);
    M = confusionM;
    classList = getClasses(imagedir);
    for idx = 1:length(classList)
        M = confusionMatrix(imagedir,char(classList(idx)),M);
    end
    load('models'); % Test prior
    model = models(4);
    modelPrior = model.prior;
  
    printMatrix(M, 'Confusion Matrix', 'Alien Arrow Butterfly Face Star Toonhead', 'Alien Arrow Butterfly Face Star Toonhead' )
    accuracy = trace(M) / sum(sum(M))
end

