function [ img ] = stitch( pyramid )
for p = length(pyramid)-1:-1:1
	pyramid{p} = pyramid{p}+EXPAND(pyramid{p+1});
end
img = pyramid{1};

end
