function [uniquemap, distances] = persistant_values(globalmeanhist, histogrammap, cmptype)
%PERSISTANT_VALUES Summary of this function goes here
%   Detailed explanation goes here

disp(histogrammap.keySet());
keySet = histogrammap.keySet();
uniquemap = java.util.HashMap();
distances = [];


for point = 1:size(keySet)
    
    keypointhist = histogrammap.get(point);
    
    distsum = dist_calc(globalmeanhist, keypointhist, cmptype);
   
    uniquemap.put(point, distsum); 

    distances = [distances; distsum];
end


end

