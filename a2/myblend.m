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
end


function [ pyramid ] = makePyramid( img, levels, alpha )
pyramid = cell(1,levels);
pyramid{1} = im2double(img);
for p = 2:levels
	pyramid{p} = REDUCE(pyramid{p-1}, alpha);
end
for p = levels-1:-1:1 
	osz = size(pyramid{p+1})*2-1;
	pyramid{p} = pyramid{p}(1:osz(1),1:osz(2),:);
end

for p = 1:levels-1
	pyramid{p} = pyramid{p}-EXPAND(pyramid{p+1}, alpha);
end

end


function [ imgout ] = EXPAND( img, alpha )
kw = 5;
ker1d = [.25-alpha/2 .25 alpha .25 .25-alpha/2];
kernel = kron(ker1d,ker1d')*4;

ker00 = kernel(1:2:kw,1:2:kw); 
ker01 = kernel(1:2:kw,2:2:kw); 
ker10 = kernel(2:2:kw,1:2:kw); 
ker11 = kernel(2:2:kw,2:2:kw); 

img = im2double(img);
sz = size(img(:,:,1));
osz = sz*2-1;
imgout = zeros(osz(1),osz(2),size(img,3));

for p = 1:size(img,3)
	img1 = img(:,:,p);
	img1ph = padarray(img1,[0 1],'replicate','both'); 
	img1pv = padarray(img1,[1 0],'replicate','both'); 
	
	img00 = imfilter(img1,ker00,'replicate','same');
	img01 = conv2(img1pv,ker01,'valid'); 
	img10 = conv2(img1ph,ker10,'valid');
	img11 = conv2(img1,ker11,'valid');
	
	imgout(1:2:osz(1),1:2:osz(2),p) = img00;
	imgout(2:2:osz(1),1:2:osz(2),p) = img10;
	imgout(1:2:osz(1),2:2:osz(2),p) = img01;
	imgout(2:2:osz(1),2:2:osz(2),p) = img11;
end

end

function [ imgout ] = REDUCE( img, alpha )
ker1d = [.25-alpha/2 .25 alpha .25 .25-alpha/2];
kernel = kron(ker1d,ker1d');

img = im2double(img);
sz = size(img);
imgout = [];

for p = 1:size(img,3)
	img1 = img(:,:,p);
	imgFiltered = imfilter(img1,kernel,'replicate','same');
	imgout(:,:,p) = imgFiltered(1:2:sz(1),1:2:sz(2));
end

end
function [ img ] = stitch( pyramid, alpha )
for p = length(pyramid)-1:-1:1
	pyramid{p} = pyramid{p}+EXPAND(pyramid{p+1}, alpha);
end
img = pyramid{1};

end
