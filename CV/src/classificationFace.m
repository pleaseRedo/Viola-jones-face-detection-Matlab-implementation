%Perform face detection on g20 image.
% Run this function after finish training the Strong Classifier vj.m
% This function needs alphaSet matrix
I1 = imread('../data/g20.jpg');
I = rgb2gray(I1);
I = im2double(I);
% figure;imshow(I);
I=histeq(I);
%figure;imshow(I);
%I = integralImage(I);
stride = 4;
[nRow,nCol] = size(I);

scale = 1.25*1.25*1.25;
windowSize = round(24*scale);
classification = zeros(nRow-windowSize,nCol-windowSize);
% Moving window moving across the g20 image with size:windowSize and
% stride:round(stride*scale)
for i = 1:round(stride*scale):nRow-windowSize
    
   for j = 1:round(stride*scale):nCol-windowSize
        
          currentWindow = I(i:i+windowSize-1,j:j+windowSize-1);

          currentWindow = imresize(currentWindow,[24 24]);
            %Perform face detection based on current window
          verdict = haarFeatureDetect(alphaSet,currentWindow);
          % Below condition used to locate the currentWindow
          % location wrt original image
          if verdict ==1
              if j ==1
                  if i==1

                     classification(i,j) = verdict;
                  else

                      classification((i-1)/round(stride*scale)+1,j) = verdict;

                  end
              else
                  if i == 1
                      classification(i,(j-1)/round(stride*scale)+1) = verdict;
                  end
                      classification((i-1)/round(stride*scale)+1,(j-1)/round(stride*scale)+1) = verdict;

              end
          else
              if j ==1
                  if i==1

                     classification(i,j) = verdict;
                  else

                      classification((i-1)/round(stride*scale)+1,j) = verdict;

                  end
              else
                  if i == 1
                      classification(i,(j-1)/round(stride*scale)+1) = verdict;
                  end
                      classification((i-1)/round(stride*scale)+1,(j-1)/round(stride*scale)+1) = verdict;
              end                                          
          end        
   end
    
end
