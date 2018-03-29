function [neighbors] = getneighbors(pixel, nhood, img, height, width)
%GETNEIGHBORS Summary of this function goes here
%   Detailed explanation goes here

neighbors = zeros(size(nhood));

x = pixel(1);
y = pixel(2);

for row = 1:size(nhood)
    
    x2 = x -row;

    for col = 1:size(nhood)
       
        y2 = y - col;
        
        if nhood(row, col) == 1
            neighbors(row,col) = img(x2, y2);
            
        else
            neighbors(row,col) = 0;
        end
       
        
    end





end

