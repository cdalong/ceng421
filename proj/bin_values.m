function [hist] = bin_values(features, radius)
%BIN_VALUES Summary of this function goes here
%   Detailed explanation goes here

hist = zeros(1, 16);

for n = 1:length(features)

    binno = 1;
    
    si = 0; %can change for bins
    s2 = radius;
    
    try
    f1 = features(n,1);
    f2 = features(n,2);
    f3 = features(n,3);
    f4 = features(n,4);
    catch exception
        disp(features);
        disp(exception);
    end
    
    if f1 > si
    
        binno = binno + 1;
    
    end
    
    if f2 > radius
    
    binno = binno + 2;
        
    end
    
    if f3 > si
    
        binno = binno + 4;
    
    end
       
    if f4 > si
    
        binno = binno + 8;
    end
    
    hist(binno) = hist(binno) +  1;
    
end

