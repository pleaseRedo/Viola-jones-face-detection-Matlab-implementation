function allf5 = f5extract( image)
%This function generate [1 -1; -1 1] feature for various size

 count=1;
 allf5 = cell(12,12);
 I = integralImage(image);
 f5 = [1 -1;-1 1];

for i = 1:12
     f5 = zeros(2*i,2);
    f5(1:end/2,1:end/2) =1;
    f5(1:end/2,end/2+1:end) =-1;
    f5(end/2+1:end,1:end/2) =-1;
    f5(end/2+1:end,end/2+1:end) =1;

    
    for j = 1:12
        
       if(j ==1 )
           allf5{i,j} = calHaar(I,f5);
           count = count +1;
          continue ;
       end
       last_val = f5(i,end);
       first_val = f5(i,1);
       f5(1:i,end+1) = last_val;
       f5(1:i,end+1) = last_val;
      
       f5(1:end/2,1:end/2) = first_val;
       f5(1:end/2,end/2+1:end) = last_val;

       f5(end/2+1:end,1:end/2) = last_val;
       f5(end/2+1:end,end/2+1:end) = first_val;

       allf5{i,j} = calHaar(I,f5);
       count = count +1;
    end
end

end

