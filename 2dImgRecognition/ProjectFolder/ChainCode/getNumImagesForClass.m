function numImages = getNumImagesForClass(imagedir, class)
    verifyImageDir(imagedir);
    imagelist = dir(sprintf('%s/%s*.gif', imagedir, class));
    numImages = length(imagelist);
end