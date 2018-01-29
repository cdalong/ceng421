I = imread('input.png');

Red = I(:,:,1);
Green = I(:,:,2);
Blue = I(:,:,3);
[yRed, x] = imhist(Red);
[yGreen, x] = imhist(Green);
[yBlue, x] = imhist(Blue);

plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');

imshow(I)
axis on
impixelinfo
%impixelregion


while true
[x,y] = ginput(1);
height = uint32(y);
length = uint32(x);

newx = [(length - 5) : (length + 5)];
newy = [(height - 5) : (height + 5)];

I1 = I(newx, newy,:);
imshow(I1);
end
%disp()