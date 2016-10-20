function copy = classifyGmm(gmm,imagedir)
    classes = getClasses(imagedir);
    
    [numRow,numCol] = size(gmm);
    copy = zeros(numRow,1);
    copy(1)

    for i = 1:numRow
        
        [MaxV,idx] = max(gmm(i,:));
        copy(i) = idx;
    end
    
end