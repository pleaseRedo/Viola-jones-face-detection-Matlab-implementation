function allf4 = f4extract( image )
%This function generate [1; -1;1]  feature for various size

I = integralImage(image);
 f4 = [1 ;-1;1];
 count=1;
  allf4 = cell(8,24);

for i = 1:8
    f4 = zeros(3*i,1);
    f4(1:end/3,1) =1;
    f4(end/3+1:2*(end/3),1) =-1;
    f4(2*(end/3)+1:end,1) =1;

    for j = 1:24
       
       if(j ==1 )
           allf4{i,j} = calHaar(I,f4);
           count = count +1;
          continue ;
       end
       f4(1:end,j)=f4(1:end,j-1);
       allf4{i,j} = calHaar(I,f4);
       count = count +1;
    end
end



end

