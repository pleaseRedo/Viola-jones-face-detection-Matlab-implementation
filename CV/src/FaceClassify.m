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

for i = 0:nPeople-1
    counti = i*64;  
    for j = 0:nExamples-1
        countj = j*64;
        datai = dataImG(counti+1:64*(i+1),countj+1:64*(j+1),:);
        faceCell{i+1,j+1} = imresize(datai,0.5); %Keep each faces(32*32)using cell array
    end
    counti = 64*i;
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
    test_data(:, i) = imf(:);

 
end;
euDistance =[];
for t = 1:nRects
    for i = 1:nPeople
        for j = 1:nExamples
            %faceCell{1,1}(:)represents first sample from class 1.
            diff = test_data(:,t)- faceCell{i,j}(:);
            distance = diff.'*diff; %this equals squared Euclidean Distance
            euDistance(i,j,t) = distance;
        end
    end     
end

avgDis =[];
for i = 1:nRects
    for j = 1:nPeople
    avgDis(j,i) = mean(euDistance(j,:,i));    
    end
end;


% Classify test data
test_pred = zeros(nRects, 1);
for i = 1:nRects
    [m n] = min(avgDis(:,i));
    test_pred(i) = n;
end;

% Evaluate the classification and plot results
EvaluateClassification(test_pred, test_true, names, rects, im);
