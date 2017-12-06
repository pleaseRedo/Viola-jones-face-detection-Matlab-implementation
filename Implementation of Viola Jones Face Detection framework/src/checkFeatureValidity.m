function flag = checkFeatureValidity(feature,featureSet)
flag=0;
  for index = 1:length(featureSet)
      if isequal(feature,featureSet{index})
          flag =1;
          break;
      end
  end
    
end