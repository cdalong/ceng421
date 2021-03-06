function [mean, stdev] = mylocalmean(f,nhood)
%MYLOCALMEAN Summary of this function goes here
%nhood is the neighborhood (same way as stdfilt)
%   Detailed explanation goes here

%{

Neighborhood, specified as a multidimensional, 
logical, or numeric array containing zeros and ones. The size of nhood must be odd in each dimension.

By default, stdfilt uses the neighborhood true(3). 
stdfilt determines the center element of the neighborhood by floor((size(nhood) + 1)/2).


%}
padding = size(nhood) + 1;
[height, width] = size(f);
img = padarray(f, size(nhood), 0);

localmeans = zeros(height, width);
localstdev = zeros(height, width);



for i = padding:height
    
   for j = padding:width
       
       neighbors = [];
       neighbors = [img(i+1,j); img(i-1,j); img(i,j+1); img(i,j-1);img(i,j)];
       %pixel = [i,j];
       avg = (img(i+1,j) + img(i-1,j) + img(i,j+1) + img(i,j-1) + img(i-1,j-1) + img(i + 1, j - 1) + img(i - 1,j +1) + img(i-1 ,j + 1) + img(i, j-1) +img(i,j))/9;
      
       
       %neighbors = getneighbors(pixel, nhood, img, height, width);
       localstdev(i - padding + 1,j - padding + 1) = std2(neighbors);
       localmeans(i - padding + 1,j - padding + 1) = avg;
       
     
   end
    
end


mean = localmeans;
stdev = localstdev;
end

