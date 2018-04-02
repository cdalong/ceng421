function [uniquemap, distances] = persistant_values(globalmeanhist,globalstddev,histogrammap, cmptype)
%PERSISTANT_VALUES Summary of this function goes here
%   Detailed explanation goes here

disp(histogrammap.keySet());
keySet = histogrammap.keySet();
uniquemap = java.util.HashMap();
alpha = 1;


for point = 1:size(keySet)
    
    keypointhist = histogrammap.get(point);
    
    [isUnique, distances] = dist_calc(globalmeanhist, globalstddev, keypointhist, alpha, cmptype);
    
    if isUnique == 1
       
      uniquemap.put(point, distances); 
      
    end
end


end

