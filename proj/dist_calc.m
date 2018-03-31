function [isUnique] = dist_calc(meanhist, std_bins, pointhist, alpha, metrictype)
%MANHATTEN_DIST Summary of this function goes here
%   Detailed explanation goes here
isUnique = true;
dist = 0;
if strcmp('man', metrictype)

for n = 1:16
    
    dist = dist + abs(pointhist(n) - meanhist(16));
end

for n = 1:16
    
   if dist > meanhist(n) + alpha * std_bins(n) %if the distance is greater than a standard deviation
       
       isUnique = false;
       
   end
   
   if dist < meanhist(n) - alpha * std_bins(n)
       
      isUnique = false;    
   
   end
     
    
end

end


if strcmp('eucl', metrictype)
    
  for n = 1:16
    
  dist = dist + (pointhist(n) - meanhist(16))^2;
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

