function confusionM = confusionEM(imagedir,gmm,allNames)
    verifyImageDir(imagedir);
    %imagelist = dir(sprintf('%s/%s*.gif', imagedir, class));
    
    classList = getClasses(imagedir);
    confusionM = zeros(6,6);
    [lengthGmm,~] = size(gmm);
    for idx = 1:lengthGmm
        %imagepath = sprintf('%s/%s', imagedir, imagelist(idx).name);
        currentClassName = gmm(idx);
        name = allNames{idx};
        classType = name(1:end-7);
        classNameInx = strmatch(classType,classList);
         if currentClassName == classNameInx

             confusionM(classNameInx,classNameInx) = confusionM(classNameInx,classNameInx)+1;
         else
             %classNewName = strncmp(currentClassName,classList,6);
             
             confusionM(classNameInx,gmm(idx)) = confusionM(classNameInx,gmm(idx))+1;
         end
    end
    printMatrix(confusionM, 'Confusion Matrix', 'Alien Arrow Butterfly Face Star Toonhead', 'Alien Arrow Butterfly Face Star Toonhead' )
    accuracy = trace(confusionM)/lengthGmm
end

