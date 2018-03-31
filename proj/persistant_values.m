function [uniquemap] = persistant_values(globalmeanhist,globalstddev,histogrammap, cmptype)
%PERSISTANT_VALUES Summary of this function goes here
%   Detailed explanation goes here
keySet = histogrammap.keySet();
uniquemap = java.util.HashMap();
alpha = 1;


for point = 1:size(keySet)
    
    keypointhist = javamap.get(point);
    
    isUnique = man_dist(globalmeanhist, globalstddev, keypointhist, alpha, cmptype);
    
    if isUnique 
       
      uniquemap.put(point, point); 
    end
end


end

