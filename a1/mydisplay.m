I = imread('input.png');

Red = I(:,:,1);
Green = I(:,:,2);
Blue = I(:,:,3);
[yRed, x] = imhist(Red);
[yGreen, x] = imhist(Green);
[yBlue, x] = imhist(Blue);

%plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');

imshow(I);
%axis on
%impixelinfo
%impixelregion


while true
[x,y] = ginput(1);
height = uint32(y);
length = uint32(x);

red = Red(length,height);
green = Green(length, height);
blue = Blue(length, height);

intensity = ((0.299*red) + (0.59*green) + (0.11*blue));


newx = [(length - 5) : (length + 5)];
newy = [(height - 5) : (height + 5)];
I1 = I(newx, newy,:);

red1 = I(newx, newy,1);
green1 = I(newx, newy,2);
blue1 = I(newx, newy, 3);

[row,col,k] = size(I1);

matrix = [row, col];

for c = 1:row
    for v = 1:col
        
        val = uint8((red1(c,v) * 0.299) + (green1(c,v) * 0.59) + (blue1(c,v)* 0.11));
        
        matrix(c,v) = val;
        
    end
end



histogram(matrix);
deviation = std(matrix);
m = mean(matrix);

deviation1 = std(deviation);
m1 = mean(m);

%imshow(I1);
%imshow(I);
end
%disp()