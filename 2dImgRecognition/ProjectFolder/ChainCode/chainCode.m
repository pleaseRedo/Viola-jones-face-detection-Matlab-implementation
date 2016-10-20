function f = chainCode( im )

% Characterise a binary image using chain code.

x=[[-1; -1; 0] [findWhiteSpot(im) ; 0]];

points=[];
for i=0:0.8:2*pi
    points=[points [sin(i); cos(i)]];
end
points=round(points);

count=2;
while ~equalVec(x(1:2,count),x(1:2,2)) || count==2
     clock = x(3,count)+5;
     for i=clock:clock+8
         plac = x(1:2,count) + points(:,mod(i,8)+1);
         if (plac(1)>0 && plac(2)>0 && plac(1)<size(im,1) && plac(2)<size(im,2) && im(plac(1),plac(2))>0.9)
            x=[x [plac ; mod(i,8)]];
            break;
         end
     end
     count=count+1;
end
g=x(:,3:end);

f(1,:) = g(2,:);
f(2,:) = g(1,:);
f(3,:) = g(3,:);

