function sortedCell = calWeight( haarFeatureNonfaceVolume,haarFeatureVolume,featureType)
% This function combines feature value from face set and non-face set, then
% return the sorted list based on thier feature value
rowF = length(haarFeatureVolume);

rowN = length(haarFeatureNonfaceVolume);
sampleArray = zeros(rowF+rowN,3);
for i = 1:rowF
%featureType(1-5) locates the current feature
   sampleArray(i,1)= haarFeatureVolume{i,featureType(1)}{featureType(2),featureType(3)}(featureType(4),featureType(5));
   sampleArray(i,2) =1;  
   sampleArray(i,3)= haarFeatureVolume{i,6};
 
end
% sampleArray(i,1) is the feature value, (i,2) is the class label,(i,3) is 
% that feature's weight
for i = 1:rowN

   sampleArray(i+rowF,1)= haarFeatureNonfaceVolume{i,featureType(1)}{featureType(2),featureType(3)}(featureType(4),featureType(5));
   sampleArray(i+rowF,2) =0;
   sampleArray(i+rowF,3)= haarFeatureNonfaceVolume{i,6};
    
end

sortedCell = sortrows(sampleArray);


end