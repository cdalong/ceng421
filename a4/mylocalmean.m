function [mean] = mylocalmean(f,nhood)
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
       
  
       pixel = [i,j];
       neighbors = getneighbors(pixel, nhood, img, height, width);
       localstdev(i - padding + 1,j - padding + 1) = std2(neighbors);
       localmeans(i - padding + 1,j - padding + 1) = mean2(neighbors);
       
     
   end
    
end


mean = localmeans;

end

