function x = findWhiteSpot( im )

% Find the first white spot in a binary image.
% working down first then accross.

i=1;
j=1;
while im(i,j)<0.9
    j=j+1;
    if j == size(im,2)
        j=1;
        i=i+1;
    end
end

x=[i;j];