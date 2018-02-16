function [ img ] = stitch( pyramid, alpha )
for p = length(pyramid)-1:-1:1
	pyramid{p} = pyramid{p}+EXPAND(pyramid{p+1}, alpha);
end
img = pyramid{1};

end
