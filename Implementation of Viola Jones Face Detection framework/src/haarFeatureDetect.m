function verdict = haarFeatureDetect(alphaSet,currentWindow)
% Used by classificationFace.m
% Detect whether the current window contains a face
% input: alphaSet(Strong classifier)
% output: verdict: face/nonface
weakClassifierOutput = zeros(2,length(alphaSet));
for alphaIndex = 1:length(alphaSet)    
currentFeature = featureGen(alphaSet{alphaIndex,2}(4),alphaSet{alphaIndex,2}(5),alphaSet{alphaIndex,2}(6)); 
[nrow,ncol] = size(currentFeature);
        
     
      subtra= currentWindow(alphaSet{alphaIndex,2}(7):nrow+alphaSet{alphaIndex,2}(7)-1,alphaSet{alphaIndex,2}(8):ncol+alphaSet{alphaIndex,2}(8)-1);
         
           
        result = sum(dot(currentFeature,subtra));
        

        if result<=alphaSet{alphaIndex,2}(2)
            weakClassifierOutput(1,alphaIndex)=1;
            
        else
            weakClassifierOutput(1,alphaIndex)=0;
        end
          
          
weakClassifierOutput(2,alphaIndex) =alphaSet{alphaIndex,1};      
    
    
end
sumAlpha = sum(weakClassifierOutput(2,:));
sumWeakClassifier = dot(weakClassifierOutput(1,:),weakClassifierOutput(2,:));
if     sumWeakClassifier>= 1/2*sumAlpha
   verdict = 1;
   
else
    verdict = 0;
    
end
end
