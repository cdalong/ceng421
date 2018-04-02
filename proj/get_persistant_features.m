function [finaluniquevals] = get_persistant_features(distances,vals, alpha)
%GET_PERSISTANT_FEATURES Summary of this function goes here
%   Detailed explanation goes here

meandistance = mean(distances);
stddevdistances = std(distances);
finaluniquevals = [];

keySet = vals.keySet();

for point = 1:size(keySet)
   
    
    pointdistance = vals.get(point);
    
    if pointdistance > meandistance + (alpha * stddevdistances)
        
        finaluniquevals = [finaluniquevals; int16(point)];
        
    end
    
    if pointdistance < meandistance - (alpha * stddevdistances)
        
        finaluniquevals = [finaluniquevals; int16(point)];
        
    end
    
    
    
end

end

