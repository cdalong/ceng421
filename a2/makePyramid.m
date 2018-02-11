function [ pyramid ] = makePyramid( img, type, levels )


pyramid = cell(1,levels);
pyramid{1} = im2double(img);
for p = 2:levels
	pyramid{p} = REDUCE(pyramid{p-1});
end
if strcmp(type,'gauss'), return; end

for p = levels-1:-1:1 % adjust the image size
	osz = size(pyramid{p+1})*2-1;
	pyramid{p} = pyramid{p}(1:osz(1),1:osz(2),:);
end

for p = 1:levels-1
	pyramid{p} = pyramid{p}-EXPAND(pyramid{p+1});
end

end