function allf3 = f3extract( image)
%This function generate [1 -1 1]  feature for various size


 count=1;
 allf3 = cell(24,8);
 I = integralImage(image);
 f3 = [1 -1 -1];

for i = 1:24
     f3 = zeros(i,3);
    f3(1:i,1) =1;
    f3(1:i,2) =-1;
    f3(1:i,3) =1;

    for j = 1:8
        
       if(j ==1 )
           allf3{i,j} = calHaar(I,f3);
           count = count +1;
          continue ;
       end
       mid_val = f3(i,round(end/2));
       first_val = f3(i,1);
       
       f3(1:i,end+1) = first_val;
       f3(1:i,end+1) = first_val;
       f3(1:i,end+1) = first_val;
        
       f3(1:i,1:end/3) = first_val;
       f3(1:i,end/3+1:2*(end/3)) = mid_val;
      
       allf3{i,j} = calHaar(I,f3);
       count = count +1;
    end
end

end

