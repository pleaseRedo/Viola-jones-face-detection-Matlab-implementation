function allf1 = f1extract( image)
%This function generate [1 -1]  feature for various size

 count=1;
 allf1 = cell(24,12);
 I = integralImage(image);
 f1 = [1 -1];

for i = 1:24
     f1 = zeros(i,2);
    f1(1:i,1) =1;
    f1(1:i,2) =-1;
    for j = 1:12
        
       if(j ==1 )
           allf1{i,j} = calHaar(I,f1);
           count = count +1;
          continue ;
       end
       last_val = f1(i,end);
       first_val = f1(i,1);
       f1(1:i,end+1) = last_val;
       f1(1:i,end+1) = last_val;
       [nrow,ncol] = size(f1);

       f1(1:i,ncol/2) = first_val;
       allf1{i,j} = calHaar(I,f1);
       count = count +1;
    end
end

end

