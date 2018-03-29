function [h] = mypostprocessing(g,morphtype, nhood)
%MYPOSTPROCESSING Summary of this function goes here
%   Detailed explanation goes here


if strcmp(morphtype, 'dilate')
    
    h = imdilate(g, nhood);
    
end

if strcmp(morphtype, 'erode')
    
    h  = imerode(g, nhood);
    
end

if strcmp(morphtype, 'open')
    
    h = imopen(g, nhood);
    
end

if strcmp(morphtype, 'close')
    
    
    h  = imclose(g,nhood);
    
end




end

