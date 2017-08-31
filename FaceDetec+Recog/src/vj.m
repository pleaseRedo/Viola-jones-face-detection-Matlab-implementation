
% Read source image 
disp('[ Reading source image ]');
imc = double(imread('../data/g20.jpg'))/255;

% Extract features from image
disp('[ Extracting features ]');
imf = mean(imc, 3); % greyscale image for now

% Select a region for template matching

% use fixed image
    imt = double(imread('../data/obama.png'));

    imt = imresize(imt, [24 24]);
    template = mean(imt, 3); % greyscale image for now
    imshow(template/255);
    %template = template - mean(template(:));
    %I = integralImage(template);



rowF=length(haarFeatureVolume);
rowN=length(haarFeatureNonfaceVolume);
for i = 1:rowF

    haarFeatureVolume{i,6} =  1/(2*rowF); 
 
end

for i = 1:rowN

    haarFeatureNonfaceVolume{i,6} =  1/(2*rowN); 
 
end
numberOfClassifier = 1;
h = waitbar(0,'Please wait...');
tic;
featureSet = cell(1);
for t = 1:numberOfClassifier
    
%result = zeros(156672-i+1,8);
count =1;
weightNormalisation;
for i = 1:5
   if i==1
      
      for j = 2:24
          for k = 1:12
              a = 25-j;
              b = 25-2*k;
              for l = 1:a
                  for m = 1:b
%                   for index = 1:length(featureSet)
%                       if isequal([i,j,k,l,m],featureSet{index})
%                           flag =1;
%                           break;
%                       end
%                   end
                   
                  if checkFeatureValidity([i,j,k,l,m],featureSet)==1
                    
                     continue; 
                      
                  end
                  result(count,1:3)= aWeakClassifier(haarFeatureNonfaceVolume,...
                      haarFeatureVolume,calWeight(haarFeatureNonfaceVolume,...
                      haarFeatureVolume,[i,j,k,l,m]),[i,j,k,l,m]);
                  result(count,4:8)= [i,j,k,l,m];

                  count = count+1;
                  
                  end
                  
              end
              %featureType = [i,j,k,a,b];
              
          end
  
      end
    
   end
   
   if i==2
      
      for j = 1:12
          for k = 1:24
              a = 25-2*j;
              b = 25-k;
              for l = 1:a
                  for m = 1:b
%                   for index = 1:length(featureSet)
%                       if isequal([i,j,k,l,m],featureSet{index})
%                           flag =1;
%                           break;
%                       end
%                   end
                  if checkFeatureValidity([i,j,k,l,m],featureSet)==1
                      
                     continue; 
                      
                  end
                      
                  result(count,1:3)= aWeakClassifier(haarFeatureNonfaceVolume,...
                      haarFeatureVolume,calWeight(haarFeatureNonfaceVolume,...
                      haarFeatureVolume,[i,j,k,l,m]),[i,j,k,l,m]);
                  result(count,4:8)= [i,j,k,l,m];

                  count = count+1;
                  end
                  
              end
              %featureType = [i,j,k,a,b];
              
          end
  
      end
    
   end    
    
    
   if i==3
     
      for j = 2:24
          for k = 1:8
              a = 25-j;
              b = 25-3*k;
              for l = 1:a
                  for m = 1:b
%                   for index = 1:length(featureSet)
%                       if isequal([i,j,k,l,m],featureSet{index})
%                           flag =1;
%                           break;
%                       end
%                   end
                  if checkFeatureValidity([i,j,k,l,m],featureSet)==1
%                       flag=0;
                     continue; 
                      
                  end
                  result(count,1:3)= aWeakClassifier(haarFeatureNonfaceVolume,...
                      haarFeatureVolume,calWeight(haarFeatureNonfaceVolume,...
                      haarFeatureVolume,[i,j,k,l,m]),[i,j,k,l,m]);
                  result(count,4:8)= [i,j,k,l,m];
                  
                  count = count+1;
                  end
                  
              end
              %featureType = [i,j,k,a,b];
              
          end
  
      end
    
   end   
  
   if i==4
        
      for j = 1:8
          for k = 1:24
              a = 25-3*j;
              b = 25-k;
              for l = 1:a
                  for m = 1:b
%                   for index = 1:length(featureSet)
%                       if isequal([i,j,k,l,m],featureSet{index})
%                           flag =1;
%                           break;
%                       end
%                   end
                  if checkFeatureValidity([i,j,k,l,m],featureSet)==1
                     continue; 
                      
                  end
                      
                  result(count,1:3)= aWeakClassifier(haarFeatureNonfaceVolume,...
                      haarFeatureVolume,calWeight(haarFeatureNonfaceVolume,...
                      haarFeatureVolume,[i,j,k,l,m]),[i,j,k,l,m]);
                  result(count,4:8)= [i,j,k,l,m];

                  count = count+1;
                  end
                  
              end
              %featureType = [i,j,k,a,b];
              
          end
  
      end
    
   end    
   if i==5
       
      for j = 1:12
          for k = 1:12
              a = 25-2*j;
              b = 25-2*k;
              for l = 1:a
                  for m = 1:b
%                   for index = 1:length(featureSet)
%                       if isequal([i,j,k,l,m],featureSet{index})
%                           flag =1;
%                           break;
%                       end
%                   end
                  if checkFeatureValidity([i,j,k,l,m],featureSet)==1
                   
                     continue; 
                      
                  end
                      
                  result(count,1:3)= aWeakClassifier(haarFeatureNonfaceVolume,...
                      haarFeatureVolume,calWeight(haarFeatureNonfaceVolume,...
                      haarFeatureVolume,[i,j,k,l,m]),[i,j,k,l,m]);
                  result(count,4:8)= [i,j,k,l,m];
                  count = count+1;
                  end
                  
              end
              %featureType = [i,j,k,a,b];
              
          end
  
      end
    
   end      
end


%3=errorcoef 2:threshold
% Find the best classifier
classifierIndex = find(result==min(result(:,1)));
bestWeakClassifier = [result(classifierIndex(1),1),result(classifierIndex(1),2),...
    result(classifierIndex(1),3),result(classifierIndex(1),4),...
    result(classifierIndex(1),5),result(classifierIndex(1),6),...
    result(classifierIndex(1),7),result(classifierIndex(1),8)];
beta = bestWeakClassifier(3)/(1-bestWeakClassifier(3));
bestFeatureType = [result(classifierIndex(1),4),...
    result(classifierIndex(1),5),result(classifierIndex(1),6),...
    result(classifierIndex(1),7),result(classifierIndex(1),8)];
% Re-weighting. Weight is the 6th element for featureVolume
for i = 1:length(haarFeatureNonfaceVolume)
    
   classify = haarFeatureNonfaceVolume{i,bestFeatureType(1)}{bestFeatureType(2),bestFeatureType(3)}(bestFeatureType(4),bestFeatureType(5));
   if classify < bestWeakClassifier(2);
      haarFeatureNonfaceVolume{i,6} = haarFeatureNonfaceVolume{i,6}*(beta^0);

   else
       haarFeatureNonfaceVolume{i,6} = haarFeatureNonfaceVolume{i,6}*(beta^1);
   end
   
    
end
for i = 1:length(haarFeatureVolume)
    
   classify = haarFeatureVolume{i,bestFeatureType(1)}{bestFeatureType(2),bestFeatureType(3)}(bestFeatureType(4),bestFeatureType(5));
   if classify < bestWeakClassifier(2)
      haarFeatureVolume{i,6} = haarFeatureVolume{i,6}*(beta^1);

   else
       haarFeatureVolume{i,6} = haarFeatureVolume{i,6}*(beta^0);
   end
   
    
end
% Calculate Alpha value
alpha = log(1/beta);
alphaSet{t,1} = alpha;
alphaSet{t,2} = bestWeakClassifier;
featureSet{t} = bestFeatureType;
waitbar(t / numberOfClassifier)



end;

toc;
close(h) 