function [histgpu] = bin_valuesgpu(features, radius)
%BIN_VALUES Summary of this function goes here
%   Detailed explanation goes here

hist = zeros(1, 16);

histgpu = gpuArray(hist);

for n = 1:length(features)

    binnogpu = gpuArray(1);
    
    sigpu = gpuArray(0); %can change for bins
    s2gpu = gpuArray(radius);
    
    try
    f1 = features(n,1);
    f2 = features(n,2);
    f3 = features(n,3);
    f4 = features(n,4);
    catch exception
       continue;
    end
    
    if f1 > sigpu
    
        binnogpu = binnogpu + 1;
    
    end
    
    if f2 > s2gpu
    
    binnogpu = binnogpu + 2;
        
    end
    
    if f3 > sigpu
    
        binnogpu = binnogpu + 4;
    
    end
       
    if f4 > sigpu
    
        binnogpu = binnogpu + 8;
    end
    
    histgpu(binnogpu) = histgpu(binnogpu) +  1;
    
end

