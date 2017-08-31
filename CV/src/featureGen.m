function feature = featureGen(type,x,y)
feature =[];
% Determing which type a given feature type belongs to
if type ==1
    for i=1:x
        feature(i,1:y) = 1;
        feature(i,y+1:2*y) = -1;
 
    end

elseif type ==2
    for i=1:y
        feature(1:x,i) = 1;
        feature(x+1:2*x,i)=-1;
    end
    
    
elseif type ==3
    for i = 1:x
        feature(i,1:y) = 1;
        feature(i,y+1:2*y)=-1;
        feature(i,2*y+1:3*y)=1;
    end

elseif type ==4
    
    for i =1:y
        feature(1:x,i) = 1;
        feature(x+1:2*x,i)=-1;
        feature(2*x+1:3*x,i)=1;    
    end
elseif type==5    
    for i =1:x
       feature(1:x,1:y) =1;
       feature(x+1:2*x,1:y) =-1;
       feature(1:x,y+1:2*y) = -1;
       feature(x+1:2*x,y+1:2*y) =1; 
    end
end
end