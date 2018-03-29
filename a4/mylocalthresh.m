function [g] = mylocalthresh(f, nhood, a,b, meantype)
%MYLOCALTHRESH Summary of this function goes here
%   Detailed explanation goes here]
% a ,b parameters of equation one
%meantype == global, local

% do the equation here




[height, width] = size(f);

output = zeros(height, width);

if strcmp(meantype, 'global')

meancmp = mean2(f);
stdev = std2(f);


for i = 1:height
    
    for j = 1:width
        

        if f(i,j) > a * stdev && f(i,j) > b * meancmp
            output(i,j) = 1;
        end
        
        
    end
end



end

if strcmp(meantype, 'local')
   

[meancmp, stdev] = mylocalmean(f, nhood);

for k = 1:size(f,1)
    
    for p = 1:size(f,2)
 

        if f(k,p) > a * stdev(k,p) && f(k,p) > b * meancmp(k,p) 
            output(k,p) = 1;
        end
        
        
    end
end

    
end

g = output;


end

