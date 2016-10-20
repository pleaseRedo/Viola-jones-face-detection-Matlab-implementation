function bool = equalVec(a,b)

% Return true if two vectors are equal.

bool=1;

for i=1:size(a)
   if a(i)~=b(i)
      bool=0; 
   end
end