function imgo = myblend(img1, img2, num_levels, alpha)

splinea = makePyramid(img1, num_levels, alpha);
splineb = makePyramid(img2, num_levels, alpha);
variable = 230;
mask1 = zeros(size(img1));
mask1(:,1:variable,:) = 1;
mask2 = 1-mask1;
blurh = fspecial('gauss',30,15); 
mask1 = imfilter(mask1,blurh,'replicate');
mask2 = imfilter(mask2,blurh,'replicate');

limgo = cell(1,num_levels); 

for p = 1:num_levels
	[Mp, Np, ~] = size(splinea{p});
	maskap = imresize(mask1,[Mp Np]);
	maskbp = imresize(mask2,[Mp Np]);
	limgo{p} = splinea{p}.*maskap + splineb{p}.*maskbp;
end

imgo = stitch(limgo, alpha);
