function [distsum] = dist_calc(meanhist, pointhist, metrictype)
%MANHATTEN_DIST Summary of this function goes here
%   Detailed explanation goes here
dist = 0;
dists = zeros(1,16);

if strcmp('man', metrictype)

for n = 1:16
    dist = abs(pointhist(n) - meanhist(n));
    dists(n) = dist;
 
end

   distsum = sum(dists);
     
    
end


if strcmp('eucl', metrictype)
    
  for n = 1:16
    
  dist = dist + (pointhist(n) - meanhist(n))^2;
  end


  dist = sqrt(dist);

  
for n = 1:16  
  
   if dist > meanhist(n) + alpha * std_bins(n) %if the distance is greater than a standard deviation
       
       isUnique = false;
       
   end
   
   if dist < meanhist(n) - alpha * std_bins(n)
       
      isUnique = false;    
   
   end
   
  
end 
    
    
    
end
end


