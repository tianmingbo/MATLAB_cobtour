function [x, y]=DDALine(xsource,ysource,xdest,ydest)
dx = abs(xdest-xsource);
dy = abs(ydest-ysource);
sx = sign(xdest-xsource);
sy = sign(ydest-ysource);
if (dy > dx)
    step = dy;
else 
    step =dx;
end
x(1) = xsource; y(1) = ysource; j = 1;
for i= 0:1:step
    if (xdest == x)&(ydest == y)
        break;
    end
    j = j+1;
    x(j) = x(j-1) + (dx/step)*sx;
    y(j) = y(j-1) + (dy/step)*sy;  
end