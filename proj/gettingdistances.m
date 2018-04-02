keySet = uniquevals.keySet();

distancefrommean = [];

temp = zeros(1,16);

for key = 1:size(keySet)
   
    distances = uniquevals.get(key);
    
    for n = 1:size(distances)
        
        temp(n) = abs(distances(n) - globalmeanhists(n));
        
    end
    
    distancefrommean = [distancefrommean; temp];
    
end

meandistancefrommean = mean(distancefrommean);

bpcombined = [meandistancefrommean(:), globalstddev(:)];

hb = bar(bpcombined, 'grouped');