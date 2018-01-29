
%function image = greyscale(imagename)

I = imread('input.png');

R=I(:,:,1); 

G=I(:,:,2); 

B=I(:,:,3);

[row,col,k] = size(I);

matrix = [row, col];

for c = 1:row
    for v = 1:col
        
        val = uint8((R(c,v) * 0.299) + (G(c,v) * 0.59) + (B(c,v)* 0.11));
        
        matrix(c,v) = val;
        
    end
end

I1 = mat2gray(matrix);

%imshow(I1)

I2 = rgb2gray(I)

imshowpair(I1, I2, 'montage');

%end