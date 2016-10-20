function [classname] = classify(imagepath)
%Classify the image specified for the given image path
  load('models');
  %Assume all models use the same number of features
  N = length(models(1).mean);
  %N = 3;
  features = getFeatures(imagepath, N);

  maxscore = -inf;
  
  %Find out which class has the highest score
  for idx = 1:length(models)
    model = models(idx);
    modelMean = model.mean;
    transMean = transpose(modelMean);
    modelCovariance = model.cov;
    modelPrior = model.prior;
    
    score = log(modelPrior) - 0.5*log(det(modelCovariance)) ...
        - 0.5*(features -transMean)*inv(modelCovariance)...
        *(features - transMean)'; 
    if score > maxscore
      maxscore = score;
      bestidx = idx;
    end
  end
 
  classname = classes(bestidx);
end