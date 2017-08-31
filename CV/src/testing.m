imc = double(imread('../data/g20.jpg'))/255;
im = mean(imc,3);
templatec = double(imread('../data/test.png'))/255;
template =imresize(templatec, [24 24]);
template = mean(template,3);
vecTemp = template(:);
[imRows,imCols,nBands] = size(imc);
dotProd = zeros(imRows,imCols);
for i = 1:nBands
    dotProdi = filter2(templatec(:,:,i),imc(:,:,i),'same');
    dotProd = dotProd + dotProdi;
end;

%  imc =imread('../data/obama.png');
% 
% 
% g = rgb2gray(imc);
% 
%     imd = imresize(g, [24 24]);
%     %ime = mean(imd, 3); % greyscale image for now
% I2 = im2double(imd);
%         imf=histeq(I2);


% featureType = [1,2,3,4,5];
% [rowF,colF] = size(haarFeatureVolume);
% for i = 1:rowF
%    sampleArray(i)= haarFeatureVolume{i,featureType(1)}{featureType(2),featureType(3)}(featureType(4),featureType(5));
%     
% end
% [rowN,colN] = size(haarFeatureNonfaceVolume);
% 
% for i = 1:rowN
%    sampleArray(i+rowF)= haarFeatureNonfaceVolume{i,featureType(1)}{featureType(2),featureType(3)}(featureType(4),featureType(5));
%     
% end
% 
% [sortedArray ,reindex] = sort(sampleArray);
% for i = 1:rowF+rowN
%     if reindex(i) > rowF
%         sign = 0;
%         weight = 1/(2*400);
%     else
%         sign = 1;
%         weight = 1/(2*200);
%     end
%     sortedCell{i,1} = [sortedArray(i),sign,weight]; 
%  
% end
rowF=200;
rowN =400;

for i = 1:rowF

    haarFeatureVolume{i,6} =  1/(2*rowF); 
 
end

for i = 1:rowN

    haarFeatureNonfaceVolume{i,6} =  1/(2*rowN); 
 
end
weightNormalisation;

bb{1} = aWeakClassifier(haarFeatureNonfaceVolume,haarFeatureVolume,calWeight(haarFeatureNonfaceVolume,haarFeatureVolume,[1,2,1,14,16]),[1,2,1,14,16]);


% 4 6 4 6 21;
% featureType= [4,6,4,6,21];
% threshold = bestWeakClassifier(2);
% errorcount = 0;
% for i = 1:rowF
%     
%    classify = haarFeatureVolume{i,featureType(1)}{featureType(2),featureType(3)}(featureType(4),featureType(5));
%    if classify < threshold
%       verdict = 1; 
%    else
%        verdict = 0;
%    end
%    errorcount = errorcount+ abs(verdict - 1);
%     
%     
%     
% end
% 
% for i = 1:rowN
%     
%    classify = haarFeatureNonfaceVolume{i,featureType(1)}{featureType(2),featureType(3)}(featureType(4),featureType(5));
%    if classify < threshold
%       verdict = 1; 
%    else
%        verdict = 0;
%    end
%    errorcount = errorcount+ abs(verdict - 0);
%     
% end 
