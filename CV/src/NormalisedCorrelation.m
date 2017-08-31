function resp = NormalisedCorrelation(imf,template)
%NORMALISEDCORRELATION Summary of this function goes here
%   Detailed explanation goes here
[imRows,imCols,nBands] = size(imf);
% vecTemp = template(:);
% vecImf = imf(:);
% 
% meanTem = mean(vecTemp);
% meanImf = mean(vecImf);
% subTem = vecTemp - meanTem;
% subImf = vecImf - meanImf;
% stdTem = std(vecTemp);
% stdImf = std(vecImf);

dotProd = zeros(imRows,imCols);
%  for i = 1:nBands
%  meanTem = mean2(template(:,:,i));
%  meanImf = mean2(imf(:,:,i));
%  stdTem = std2(template(:,:,i));
%  stdImf = std2(imf(:,:,i));
%  dotProdi = filter2((template(:,:,i)-meanTem)/(stdTem * ...
%      sqrt(numel(template(:,:,i)))),(imf(:,:,i)-meanImf)/...
%      (stdImf* sqrt(numel(imf(:,:,i)))),'same');
%  dotProd = dotProd + dotProdi; 
%  end;
% 
%  resp = dotProd;

 for i = 1:nBands
     meanTem = mean2(template(:,:,i));
     meanImf = mean2(imf(:,:,i));
     stdTem = std2(template(:,:,i));
     stdImf = std2(imf(:,:,i));
     dotProdi = filter2((template(:,:,i)-meanTem)/sqrt(stdTem^2 * numel(template(:,:,i)))...
         ,(imf(:,:,i)-meanImf)/sqrt(stdImf^2 * numel(imf(:,:,i)))...
         ,'same');
     dotProd = dotProd + dotProdi; 
 end;

 resp = dotProd;

end

