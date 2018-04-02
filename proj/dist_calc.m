function [isUnique, distances] = dist_calc(meanhist, std_bins, pointhist, alpha, metrictype)
%MANHATTEN_DIST Summary of this function goes here
%   Detailed explanation goes here
isUnique = false;
dist = 0;
dists = zeros(1,16);
distances =[];
if strcmp('man', metrictype)

for n = 1:16
    %isUnique = false;
    dist = abs(pointhist(n) - meanhist(n));
    dists(n) = dist;
   if dist > meanhist(n) + alpha * std_bins(n) %if the distance is greater than a standard deviation
       
       isUnique = true;
       
   end
   
   if dist < meanhist(n) - alpha * std_bins(n)
       
      isUnique = true;    
   
   end
     
    
end

distances = [distances; dists];

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


