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
  dist(n) = dist;
  end

  distsum = sum(dists);

  distsum = sqrt(distsum);

 
    
end
end


