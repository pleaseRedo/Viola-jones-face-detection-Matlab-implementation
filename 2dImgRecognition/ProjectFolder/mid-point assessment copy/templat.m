num = getNumImages('images/train');
clusters = getClusters('images/train',6);
gmmM = gmmEM(clusters,6);
allFiles = dir('images/train');
allNames = { allFiles.name };
allNames(1) = [];
allNames(1) = [];
unSupervisedOut = classifyGmm(gmmM,'images/train');
confusionEM('images/train',unSupervisedOut,allNames);