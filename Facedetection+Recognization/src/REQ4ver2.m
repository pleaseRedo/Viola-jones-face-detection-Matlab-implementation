close all;
% FaceClassify.m

% Load test and training images
im = double(imread('../data/g20.jpg'))/255;
dataIm = double(imread('../data/facedata.png'))/255;

%Greyscal for the facedata.png
dataImG = mean(dataIm,3);
 dataImG = dataImG - mean(dataImG(:)); 
 dataImG = dataImG / std(dataImG(:));
names={'barroso','calderon','cameron','erdogan','gillard','harper','hollande','jintao','kirchner','merkel'...
    ,'monti','myungbak','noda','obama','putin','rompuy','rousseff','singh','yudhoyono','zuma'};
nPeople=20;   % number of people (rows of dataIm)
nExamples=32; % number of examples per person (columns of dataIm)
imsz=64;      % size of face images in dataIm (square)



% Extract faces from facedata
faceCell = cell(20,32);
faceVector=[];
for i = 0:nPeople-1
    counti = i*64;  
    for j = 0:nExamples-1
        countj = j*64;
        datai = dataImG(counti+1:64*(i+1),countj+1:64*(j+1),:);
        datai = imresize(datai,0.5);
      
        %faceCell{i+1,j+1} = datai; %Keep each faces(32*32)using cell array
        %faceVector(j+1,:,i+1) = datai(:);
        faceVector(j+1,:,i+1) = datai(:);
    end
    counti = 64*i;
end
counti = 64*i;
trainVector=[];testVector=[];trainVectorWhole = [];
trainVector(1:24,:) = faceVector(1:24,:,1);trainVectorWhole(1:32,:) = faceVector(1:32,:,1);
testVector(1:8,:)=faceVector(25:32,:,1);
for i = 2:20
       trainVector(24*(i-1)+1:i*24,:) = faceVector(1:24,:,i);
end
for i = 2:20
       testVector(8*(i-1)+1:i*8,:) = faceVector(25:32,:,i);
end
for i = 2:20
       trainVectorWhole(32*(i-1)+1:i*32,:) = faceVector(1:32,:,i);
end
label=[];labelTest=[];labelWhole=[];
label(1:24,1) = 1; 
labelWhole(1:32,1) = 1; 
for i = 2:20
       label(24*(i-1)+1:i*24,:) = i;
end
for i = 2:20
       labelWhole(32*(i-1)+1:i*32,:) = i;
end
labelTest(1:8,1) = 1;
for i = 2:20
       labelTest(8*(i-1)+1:i*8,:) = i;
end
% Load Viola-Jones detection rectangles and set ground truth
load('../data/vjrects', 'rects');
test_true = {'kirchner', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'monti', 'harper', 'barroso', 'hollande', 'rousseff', 'x', 'cameron', ...
    'x', 'noda', 'yudhoyono', 'calderon', 'putin', 'x', 'rompuy', 'merkel', 'x', 'x', 'obama', 'singh', 'jintao', 'zuma','myungbak'};

% Get test data
nRects = size(rects, 1);
test_data = [];
for i = 1:nRects
    imi = im(rects(i, 1):rects(i, 3), rects(i, 2):rects(i, 4), :);
    imf = mean(imi, 3);
    imf = imresize(imf, [32 32]);
    
    imf = imf - mean(imf(:)); % subtract mean and divide standard deviation
    imf = imf / std(imf(:));
     test_data(:,i) = imf(:); %image in column vector
 
end;




%% Classify Test 

% % Classify test data 6/18, kernel 0 8/18
model=svmtrain(labelWhole,trainVectorWhole,'-t 0');
test_pred = zeros(nRects, 1);
for i = 1:nRects
    
    % Random classification for now
    %test_pred(i) = randi(20);
    %[m n] = min(avgDis(:,i));
    
    %test_pred(i) = classifyFace(test_data(i,:),meanValue,covValue);
    [predicted_label] = svmpredict([i],transpose(test_data(:,i)) , model);
     test_pred(i) = predicted_label;
end;

% Evaluate the classification and plot results
EvaluateClassification(test_pred, test_true, names, rects, im);
