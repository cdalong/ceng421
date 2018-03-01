%From assignment spec: threshold-based implementation: based on histogram
%analysis.
%automatically compute two thresholds that seperat the three types of
%tissue.

%Input: given a binary image of the image sans- skull. Can I translate that
%back to the original (non-binary image)?

%Answer: probably

%%how the hell do we do histograms in matlab one wonders too

function [img] = double_thresholding(img)

histogram = imhist(img);
plot(histogram);