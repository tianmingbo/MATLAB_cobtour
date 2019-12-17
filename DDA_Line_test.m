%NAME     : CHANDAN KUMAR 
%ROLL NO  : 05ME3004
%COURSE   : COMPUTER GRAPHICS AND SOLID MODELLING
%SUBJECT  : DIGITAL DIFFERENTIAL LINE DRAWING ALGORITHM
% function draw(x0,y0,x1,y1)
clc 
clear
% point = input('Give coord[ x0 y0 x1 y1]: '); 
point=[58.5080 86.7275 63.0976 89.2824];%[2.2 3.1 1.0 1.0];
x0 = point(1);y0 = point(2); x1 = point(3);y1=point(4);
dx = abs(x1-x0);
dy = abs(y1-y0);
sx = sign(x1-x0);
sy = sign(y1-y0);
if (dy > dx)
    step = dy;
else 
    step = dx;
end
x(1) = x0; y(1) = y0; j = 1;
for i= 0:1:step
    if (x1 == x)&(y1 == y)
        break;
    end
    j = j+1;
    x(j) = x(j-1) + (dx/step)*sx;
    y(j) = y(j-1) + (dy/step)*sy;  
end
plot(round(x),round(y),'rs');
grid on ,hold on

plot(x,y,'b^');
axis([0 100 0 100]);
legend('DDA Points','Actual points',2);
title('Digital Differential Line Drawing Algorithm')