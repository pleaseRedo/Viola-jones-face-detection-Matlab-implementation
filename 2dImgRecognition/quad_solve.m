function x = quad_solve(a, b, c)
% x = quad_solve( a,b,c )
% solve a quadratic function ax^2 + bx + c = 0, given a, b, and c.
h = sqrt( b^2 - 4*a*c );
x(1) = (b + h)/(2*a);
x(2) = (b - h)/(2*a);
end