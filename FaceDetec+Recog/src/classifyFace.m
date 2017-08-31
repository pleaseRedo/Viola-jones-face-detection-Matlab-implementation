function classification = classifyFace(featureHog,hogMeanValue,hogCovValue)
% This function is used to calculate p(theta|x)
currentMax = -inf;
for i = 1:20
    currentMean = hogMeanValue(i,:);
    currentCov = hogCovValue(:,:,i);
    prior = 1/20;
    [u,d]=eig(currentCov);
    argMax = log(prior) - 0.5*sum(real(log(diag(d))))...
        -0.5*(featureHog-currentMean)*inv(currentCov)*...
        transpose(featureHog-currentMean);
    if argMax > currentMax
        currentMax = argMax;
        classification = i;
        
    end

end
end