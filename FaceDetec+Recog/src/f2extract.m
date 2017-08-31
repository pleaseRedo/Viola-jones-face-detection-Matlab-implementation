function allf2 = f2extract( image )
%This function generate [1 ;-1]  feature for various size

I = integralImage(image);
 f2 = [1 ;-1];
 count=1;
  allf2 = cell(12,24);

for i = 1:12
    f2 = zeros(2*i,1);
    f2(1:i,1) =1;
    f2(i+1:end,1) =-1;
    for j = 1:24
       
       if(j ==1 )
           allf2{i,j} = calHaar(I,f2);
           count = count +1;
          continue ;
       end
       last_val = f2(end,1);
       first_val = f2(1,1);
       f2(1:i,j) = first_val;
       f2(i+1:end,j) = last_val;

       allf2{i,j} = calHaar(I,f2);
       count = count +1;
    end
end



end

