function confusionM = confusionMatrix(imagedir,class,confusionM)
    verifyImageDir(imagedir);
    imagelist = dir(sprintf('%s/%s*.gif', imagedir, class));
    
    classList = getClasses(imagedir);
    className = strncmp(class,classList,6);
    
    if isempty(imagelist)
        error('No images for class');
    end
    for idx = 1:length(imagelist)
        imagepath = sprintf('%s/%s', imagedir, imagelist(idx).name);
        currentClassName = classify(imagepath);
         if strcmp (currentClassName,class)
             confusionM(className,className) = confusionM(className,className)+1; 
         else
             classNewName = strncmp(currentClassName,classList,6);
             confusionM(className,classNewName) = confusionM(className,classNewName)+1;
         end
    end
end

