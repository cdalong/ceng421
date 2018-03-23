function [isUnique] = man_dist(meanhist, std_bins, pointhist)
%MANHATTEN_DIST Summary of this function goes here
%   Detailed explanation goes here

isUnique = true;

for n = 1:16
    
  
    dist = abs(pointhist(n) - meanhist(16));
    
   if dist > std_bins(n) %if the distance is greater than a standard deviation
       
       isUnique = false;
       
   end

    
    
end



end

