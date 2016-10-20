testDir = 'images/train';
num = getNumImages(testDir);
clusters = getClusters(testDir,6);
gmmM = gmmEM(clusters,6);
allFiles = dir(testDir);
allNames = { allFiles.name };
allNames(1) = [];
allNames(1) = [];
unSupervisedOut = classifyGmm(gmmM,testDir);
confusionEM(testDir,unSupervisedOut,allNames);

for idx = 1:10
   if 
    
    
end   