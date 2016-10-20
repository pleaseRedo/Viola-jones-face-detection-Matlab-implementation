function coodinates = reconstructChainCode(chainCode)
%reconstructChainCode Reconstructs the image co-ordinates from the
%chain code, starting at (0, 0)

%The length of the segments is either 1 (horizontal and vertical) or sqrt(2) 
lengths = 1*(rem(chainCode, 2)==0) + sqrt(2)*(rem(chainCode, 2)==1);

%Calculate the angle and hence direction moved at each point
angles = chainCode*(2*pi/8); 
directions = [cos(angles); -sin(angles)].* [lengths; lengths];

%Start at (0,0)
coodinates = [0;0];

%Walk around the chain code
for i = 2:size(chainCode,2);
    coodinates(:,i) = coodinates(:,i-1) + directions(:,i);
end


end

