function dataMatrix = getClusters(imagedir, N)
classes = getClasses(imagedir);
    class = classes{1};

totalImages = getNumImages(imagedir)

dataMatrix = getDataMatrix(imagedir, class, N);

for idx = 2:length(classes)
    class = classes{idx};
    
    dataMatrix = vertcat(dataMatrix,getDataMatrix(imagedir, class, N));
    


end

end 