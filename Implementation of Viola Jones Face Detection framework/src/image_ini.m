% This function will generate face and non-face haar feature value


facefiles=dir('../data/face/*.pgm');
nonfacefiles=dir('../data/nonface/*.png');

face_data=zeros(length(facefiles),3);
% haarFeatureVolume = cell(200,5);
% haarFeatureNonfaceVolume = cell(400,5);

nonface_data=zeros(length(nonfacefiles),3);

filename=['../data/face/',strcat(facefiles(1).name)];
dataIm = imread('../data/facedata.png');
dataIm = rgb2gray(dataIm);
dataIm = im2double(dataIm);
dataIm = histeq(dataIm,256);
faceCell = cell(20,32);
for i = 0:nPeople-1
    counti = i*64;  
    for j = 0:nExamples-1
        countj = j*64;
        datai = dataImG(counti+1:64*(i+1),countj+1:64*(j+1),:);
        faceCell{i+1,j+1} = imresize(datai,[24 24]); 
    end
    counti = 64*i;
end
 count =1;
 % For facedata.png
for i =1:20
    
    
    for j =1:32
       haarFeatureVolume{200+count,1} = f1extract(faceCell{i,j});
       haarFeatureVolume{200+count,2} = f2extract(faceCell{i,j});
       haarFeatureVolume{200+count,3} = f3extract(faceCell{i,j});
       haarFeatureVolume{200+count,4} = f4extract(faceCell{i,j});
       haarFeatureVolume{200+count,5} = f5extract(faceCell{i,j});
        
         count = count +1;
    end
    
end
h = waitbar(0,'Please wait...');
%face
for i=1:length(facefiles)
    
    
    filename=['../data/face/',strcat(facefiles(i).name)];
    
    im=imread(filename);
    
    im=mat2gray(im);
    
    im=histeq(im,256);
    faces{i} = im;
    haarFeatureVolume{i,1}= f1extract(im);
    haarFeatureVolume{i,2}= f2extract(im);
    haarFeatureVolume{i,3}= f3extract(im);
    haarFeatureVolume{i,4}= f4extract(im);
    haarFeatureVolume{i,5}= f5extract(im);

    waitbar(i / length(facefiles))
    
  

end
%nonface
for i=1:length(nonfacefiles)
    
    filename=['../data/nonface/',strcat(nonfacefiles(i).name)];
    im= imread(filename);
    im=mat2gray(im);
    im=histeq(im);
    nonfaces{i} = im;
    haarFeatureNonfaceVolume{i,1}= f1extract(im);
    haarFeatureNonfaceVolume{i,2}= f2extract(im);
    haarFeatureNonfaceVolume{i,3}= f3extract(im);
    haarFeatureNonfaceVolume{i,4}= f4extract(im);
    haarFeatureNonfaceVolume{i,5}= f5extract(im);
    waitbar(i / length(nonfacefiles))
end

close(h)    
