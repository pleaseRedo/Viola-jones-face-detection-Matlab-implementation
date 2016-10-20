
clear;
A = getDataMatrix('images/train','Alien',3);
B = getDataMatrix('images/train','Arrow',3);
C = getDataMatrix('images/train','Butterfly',3);
D = getDataMatrix('images/train','Face',3);
E = getDataMatrix('images/train','Star',3);
F = getDataMatrix('images/train','Toonhead',3);

%C = getDataMatrix('images/train','Star',3);
for i=1:size(A)
    %i
    
    %B(1,i)
    %scatter(B(1,1),i)
    scatter(A(i,1),A(i,2),[],[0,0,0],'filled')
    hold on;

end
for i=1:size(B)
    %i
    
    %B(1,i)
    %scatter(B(1,1),i)
    scatter(B(i,1),B(i,2),[],[0,0,0],'filled')
    hold on;

end

for i=1:size(C)
    %i
    
    %B(1,i)
    %scatter(B(1,1),i)
    scatter(C(i,1),C(i,2),[],[0,0,0],'filled')
    hold on;

end
for i=1:size(D)
    %i
    
    %B(1,i)
    %scatter(B(1,1),i)
    scatter(D(i,1),D(i,2),[],[0,0,0],'filled')
    hold on;

end
for i=1:size(E)
    %i
    
    %B(1,i)
    %scatter(B(1,1),i)
    scatter(E(i,1),E(i,2),[],[0,0,0],'filled')
    hold on;

end
for i=1:size(F)
    %i
    
    %B(1,i)
    %scatter(B(1,1),i)
    scatter(F(i,1),F(i,2),[],[0,0,0],'filled')
    hold on;

end