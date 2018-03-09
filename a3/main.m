%this will generate most of the images from the current settings
%double_thresholding: 110, 160
%region growing: 20

img1 =  imread('brain1.jpg');
img2 =  imread('brain2.jpg');
img3 =  imread('brain3.jpg');

%remove the outer region boi
pre1 = preprocess(img1);
pre2 = preprocess(img2);
pre3 = preprocess(img3);

withoutskull1 = bsxfun(@times, img1, cast(pre1, class(img1)));
withoutskull2 = bsxfun(@times, img2, cast(pre2, class(img2)));
withoutskull3 = bsxfun(@times, img3, cast(pre3, class(img3)));

thresholded1 = double_thresholding(withoutskull1);
thresholded2 = double_thresholding(withoutskull2);
thresholded3 = double_thresholding(withoutskull3);

region_growed1 = region_growing(withoutskull1);
region_growed2 = region_growing(withoutskull2);
region_growed3 = region_growing(withoutskull3);



h    = [];
h(1) = subplot(1,3,1);
h(2) = subplot(1,3,2);
h(3) = subplot(1,3,3);
image(region_growed1,'Parent',h(1));
image(region_growed2,'Parent',h(2));
image(region_growed3,'Parent',h(3));

 
 
 
 