function f1r = calHaar( image,feature )
%Calculate Haar feature value. The input Image matrix is "Integral Image".
I = image;
[nrow,ncol] = size(feature);
[rowII,colII] = size(image);
for i = 2:rowII-nrow+1
    for j = 2:colII-ncol+1
        [nrow,ncol] = size(feature);   

        for ii = 1:nrow
            for jj = 1:ncol
                subtra(ii,jj) = I(i+(ii-1),j+(jj-1)) +...
                    I(i+(ii-1)-1,j+(jj-1)-1)-I(i+(ii-1)-1,...
                    j+(jj-1))-I(i+(ii-1),j+(jj-1)-1);
            end
        end       
        result = dot(feature,subtra);       
        f1r(i-1,j-1) =   sum(result); 
    end

end

end

