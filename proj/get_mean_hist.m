function [meanhist] = get_mean_hist(avg, meantype)
%GET_MEAN_HIST Summary of this function goes here
%   Detailed explanation goes here

meanhist = [];
sums = [];
percentages = zeros(size(avg, 1),size(avg, 2));
%have to calculate sum values first

if strcmp("global", meantype)

for i = 1:size(avg, 1)
    
    sum = 0;
    
    for j = 1:size(avg, 2)
        
    %row operations    
    
    sum = sum + avg(i,j);
    
    
    
    end
    
    sums = [sums;sum];   
    
end

%gotta find percentage in each bin now //normalize the values

for k = 1:size(avg, 1)
    
    
    
    for l = 1:size(avg, 2)
        
    %row operations    
    
    percentages(k,l) = (avg(k,l)/sums(k)) * 100;
    
    end
        
end

meanhist = mean(percentages);

end

if strcmp("local", meantype)

for i = 1:size(avg, 1)
    
    sum = 0;
    
    for j = 1:size(avg, 2)
        
    %row operations    
    
    sum = sum + avg(i,j);
    
    
    
    end
    
    sums = [sums;sum];   
    
end

%gotta find percentage in each bin now //normalize the values

for k = 1:size(avg, 1)
    
    
    
    for l = 1:size(avg, 2)
        
    %row operations    
    
    percentages(k,l) = (avg(k,l)/sums(k)) * 100;
    
    end
        
end

meanhist = percentages;

end


end

