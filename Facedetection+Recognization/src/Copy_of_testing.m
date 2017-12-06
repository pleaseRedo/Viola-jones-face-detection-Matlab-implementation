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

aWeakClassifier(haarFeatureNonfaceVolume,haarFeatureVolume,[1,2,3,4,5])



%Weigh
% weights(1:200) = 1;
% weights(201:600) = 0;
% weights(2,1:200) = 1/(2*200);
% weights(2:201:600)= 1/(2*400);
% %sort
% [rowF,colF] = size(haarFeatureVolume);
% for i = 1:rowF
%    sampleArray(i)= haarFeatureVolume{i,1}{1,1}(1,1);
%     
% end
% [rowN,colN] = size(haarFeatureNonfaceVolume);
% 
% for i = 1:rowN
%    sampleArray(i+rowF)= haarFeatureNonfaceVolume{i,1}{1,1}(1,1);
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
% 
% sminus = 0;
% splus=0;
% for i = 1:find(sortedArray == haarFeatureNonfaceVolume{1,1}{1,1}(1,1))-1
%     if sortedCell{i,1}(2) == 0;
%         
%         sminus = sminus+sortedCell{i,1}(3);
%         
%     else
%         splus = splus+sortedCell{i,1}(3);
% 
%     end
%      
%  
% end
% tminus=0;
% tplus=0;
% for i = 1:600
%     if sortedCell{i,1}(2) == 0;
%         
%         tminus = tminus+sortedCell{i,1}(3);
%         
%     else
%         tplus = tplus+sortedCell{i,1}(3);
% 
%     end
%     
% end
% errorCoefficient = min(splus+(tminus-sminus),sminus+(tplus-splus));


