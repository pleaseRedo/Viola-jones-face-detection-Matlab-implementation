function train(imagedir, N)
%Train a GMM models uses shapes in imagedir using N features
classes = getClasses(imagedir);
totalImages = getNumImages(imagedir)
for idx = 1:length(classes)
    class = classes{idx};
    models(idx).name = class;
    dataMatrix = getDataMatrix(imagedir, class, N); %Get feature vectors
    models(idx).mean = transpose(calcMean(dataMatrix));
    models(idx).cov = ensurePSD(calcCov(dataMatrix));%Non-singular Cov
    models(idx).prior = getNumImagesForClass (imagedir, class)/totalImages;
    
end

  save('models');

end 