function functionOutput = aWeakClassifier( haarFeatureNonfaceVolume,haarFeatureVolume,sortedCell,featureType)
% aWeakClassifier is a function used to compute the current
% weakclassifier's error rate.
% Input: non-face data, face data, sorted feature value, feature type
% Output: a vector containing [number of mislabelling,threshold value, error rate]
rowF = length(haarFeatureVolume);
rowN = length(haarFeatureNonfaceVolume);
tminus=0;
tplus=0;
%Calculate T+ and T-
for i = 1:rowF+rowN
    if sortedCell(i,2) == 0;
        tminus = tminus+sortedCell(i,3);
    else
        tplus = tplus+sortedCell(i,3);

    end

end

errorCoefficient = zeros(1,rowF+rowN);

sminus = 0;
splus=0;
% Calculate S+ and S-
for i = 1:rowN+rowF
    if i ==1
        errorCoefficient(i) = min(splus+(tminus-sminus),sminus+(tplus-splus));
        continue;
    end     
     if sortedCell(i,2) == 0;

        sminus = sminus+sortedCell(i,3);

     else
        splus = splus+sortedCell(i,3);

     end
% Find the error rate e:
% e = min(S^+ + (T^- - S^-), S- + (T^+ - S^+))
errorCoefficient(i) = min(splus+(tminus-sminus),sminus+(tplus-splus));   
end
%
index = find(errorCoefficient == min(errorCoefficient));
if length(index)==1
    if index ==1
    threshold =    sortedCell(index(1),1);
    else
        threshold = (sortedCell(index(1),1)+sortedCell(index(1)-1,1))/2; 
    end
else
    
    threshold = (sortedCell(index(2),1)+sortedCell(index(2)-1,1))/2; 
    
end

% Testing the current classifier
errorcount = 0;
% Testing face class
for i = 1:rowF
   classify = haarFeatureVolume{i,featureType(1)}{featureType(2),featureType(3)}(featureType(4),featureType(5));
   if classify < threshold
      verdict = 1; 
   else
       verdict = 0;
   end
   errorcount = errorcount+ abs(verdict - 1);
end
% Testing non-face class
for i = 1:rowN
   classify = haarFeatureNonfaceVolume{i,featureType(1)}{featureType(2),featureType(3)}(featureType(4),featureType(5));
   if classify < threshold
      verdict = 1; 
   else
       verdict = 0;
   end
   errorcount = errorcount+ abs(verdict - 0);
end
% errorcount:number of mislabelling 
% min(errorCoefficient): error rate "e"
functionOutput = [errorcount,threshold,min(errorCoefficient)];
end