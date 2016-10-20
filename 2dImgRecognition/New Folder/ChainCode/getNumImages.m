function numImages = getNumImages(imagedir)
    verifyImageDir(imagedir)
    imagelist = dir(sprintf('%s/*.gif', imagedir));
    numImages = length(imagelist);
end