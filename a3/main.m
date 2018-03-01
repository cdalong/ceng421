img =  imread('brain3.jpg');


%remove the outer region boi
img2 = preprocess(img);

%imshow(img2);

withoutskull = bsxfun(@times, img, cast(img2, class(img)));


imshow(withoutskull);
%double_thresholding(img) (withoutskull)
%region_growing(img)