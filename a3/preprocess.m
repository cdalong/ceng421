function [ img ] = preprocess(imgin)
thres = graythresh(imgin);
img = imbinarize(imgin,thres);

%then, select the connected component (the brain)
%bwconncomp finds connected components in the binary image

%from Matlab docs, bwconncomp(BW) returns the connected components CC found in the binary image BW. bwconncomp uses a default connectivity of 8 for two dimensions, 
%26 for three dimensions, and conndef(ndims(BW),'maximal') for higher dimensions.

ConnectedComponents = bwconncomp(img);

numPix = cellfun(@numel, ConnectedComponents.PixelIdxList);

[~, idx] = max(numPix);

biggest = zeros(size(img));

biggest(ConnectedComponents.PixelIdxList{idx}) = 1;

%remove the skull with mask

%imshow(biggest);

img = biggest;
%This has removed the largest connected component, and set it to zero.
%Now what? one asks

%From the assignment, "If	the	inner	and	outer	regions	are	connected	via	narrow	bridges, you	can	
%separate	them	using	morphological	operations

%Thoughts: maybe not needed as the threshold seems to be working fine atm.
%should check with Amanda

%imshow(img);