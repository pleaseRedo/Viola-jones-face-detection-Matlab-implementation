%One face region may be detected by multiple times, thus using this script 
% to combine multiple detected window into one.
% Run this script last to visualize the result.

[nrowCf,ncolCf] = size(classification);
boundary = round(windowSize/round(stride*scale));
convergedWindow = zeros(size(classification));
% Combining window, the resulting window's location are computed by
% averaging are windows' coordinates.
for i = 1:boundary:nrowCf-boundary
    for j=1:boundary:ncolCf-boundary
        [row ,col] = find(classification(i:i+boundary-1,j:j+boundary-1));
        if sum(row) >=1
            itemp = round(sum(row)/length(row))+i;
            jtemp = round(sum(col)/length(col))+j;
            convergedWindow(itemp,jtemp) = 1; 
        end

    end
    
    
end
count =1;
[nrowCf,ncolCf] = size(convergedWindow);
rect = zeros(1);
% Draw rectangle
for i = 1:nrowCf
    
    for j = 1:nrowCf
        if convergedWindow(i,j)==1
            rect(count,1:4) = [(j-1)*(scale*stride)+1,(i-1)*(scale*stride)+1,windowSize,windowSize];
            count = count+1;
            
        end
        
    end
end
J = insertShape(I1, 'Rectangle',rect,'LineWidth',2);
imshow(J);
