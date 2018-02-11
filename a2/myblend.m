close all
clear
img1 = im2double(imread('apple.jpg'));
img2 = im2double(imread('orange.jpg')); %we have to assume these are the same size
[M, N, ~] = size(img1); % matrix sizes


variable = 230;
levels = 7;

splinea = makePyramid(img1, 'lap', levels)
splineb = makePyramid(img2, 'lap', levels)

mask1 = zeros(size(img1));
mask1(:,1:variable,:) = 1;
mask2 = 1-mask1;
blurh = fspecial('gauss',30,15); % feather the border
mask1 = imfilter(mask1,blurh,'replicate');
mask2 = imfilter(mask2,blurh,'replicate');

limgo = cell(1,levels); % the blended pyramid
for p = 1:levels
	[Mp, Np, ~] = size(splinea{p});
	maskap = imresize(mask1,[Mp Np]);
	maskbp = imresize(mask2,[Mp Np]);
	limgo{p} = splinea{p}.*maskap + splineb{p}.*maskbp;
end

imgo = stitch(limgo);
figure,imshow(imgo) % blend by pyramid
imgo1 = mask1.*img1+mask2.*img2;
%figure,imshow(imgo1) % blend by feathering