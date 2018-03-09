img =  imread('brain2.jpg');
%remove the outer region boi
img2 = preprocess(img);

%imshow(img2);

withoutskull = bsxfun(@times, img, cast(img2, class(img)));

%imshow(withoutskull);
%double_thresholding(withoutskull)
region_growing(withoutskull);