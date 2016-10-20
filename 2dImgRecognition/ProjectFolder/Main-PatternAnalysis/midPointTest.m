% This script tests to see if the supplied functions meet the mid point
% assessment. (Note that you are only required to meet the criterea in the
% coursework specification so you functions need not meet the strict
% format specified here.) 

D = [0.6443, 0.9390, 0.2077; 0.3786 0.8759 0.3012; 0.8116 0.5502 0.4709; 
     0.5328 0.6225 0.2305; 0.3507 0.5870 0.8443];

tolerance = 0.01; 

%%Mean vector test
if exist('calcMean')
  diff = calcMean(D) - mean(D, 1);
  sumDiff = sum(diff(:));
  if sumDiff < tolerance
    disp('calcMean appears to be correct.');
  else
    disp('calcMean does not appear to be correct.');
  end
else
  disp('Missing function calcMean');
end

%%Covariance matrix test
if exist('calcCov')
  diff = calcCov(D) - cov(D, 1);
  sumDiff = sum(diff(:));
  if sumDiff < tolerance
    disp('calcCov appears to be correct.');
  else
    disp('calcCov does not appear to be correct.');
  end
else
  disp('Missing function calcCov');
end

%%Feature test (Optional)
if exist('getFeatures')
  preCalc = [401.6808 95.7374 58.4391];
  diff = getFeatures('images/train/Alien001.gif', 3) - preCalc;
  
  sumDiff = sum(diff(:));
  if sumDiff < tolerance
    disp('getFeatures appears to be correct.');
  else
    disp('getFeatures does not appear to be correct.');
  end
else
  disp('Skipping features test');
end

