%From assignment spec: threshold-based implementation: based on histogram
%analysis.
%automatically compute two thresholds that seperat the three types of
%tissue.

%Input: given a binary image of the image sans- skull. Can I translate that
%back to the original (non-binary image)?

%Answer: probably

%%how the hell do we do histograms in matlab one wonders too

%do we need initial guess values? From the slides: yes.

function [img] = double_thresholding(img)

%imshow(img);
%hist = imhist(img);
%plot(hist);
Thres1 = 110;
Thres2 = 160;
minimumchange = 1;

Thres1new = 4234;
Thres2new = 345435;
while (Thres1new - Thres1 > minimumchange && Thres2new - Thres2 > minimumchange)
group1 = img <= Thres1;
group2 = img > Thres1; %can you do y < x <= c
group4 = group2 < Thres2;
group3 = img > Thres2;

mean1 = mean(img(group1));
mean2 = mean(img(group4));
mean3 = mean(img(group3));
%calculate means of groups until this stabilizes
Thres1new = (mean1 + mean2)/2;
Thres2new = (mean2 + mean3)/2;

Thres1 = Thres1new;
Thres2 = Thres2new;
end

segments = imquantize(img, [Thres1, Thres2]);
%apparently we can use multithresh now, so let's so what we get
thresh = multithresh(img, 3);

seg_I = imquantize(img, thresh); % values from 1 - 4
RGB = label2rgb(seg_I); 	 
figure;
imshow(RGB)

%my original implementations image
img = mat2gray(segments);

figure;
imshow(img);
end

%how do you do while loops? lol
