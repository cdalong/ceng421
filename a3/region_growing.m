%Now, what exactly is region growing?

%from slides: start from one seed pixel p, located inside region R
%Define a 'similarity measure' (whatever that is) for any pixel I and J in
%the image
%Add an adjacent pixel q to pixel p (initial pixel) region if and only if
%The similarity is above some threshold T
%evaluate all naighbours this way
%go to q next
%go until all pixels in neighbourhood have been touched

%Concerns: how do we pick seed pixels?
%How do we pick a similarity?
%How do we pick a threshold? (variable or fixed?)
% evaluate forwards or backwards?

%From assignment, histogram analysis? it's the same from the other function
%I assume

%ooooooorrr we can use the peaks of the histogram this time?

% or a random pixel from the thresholded regions?

function [img] = region_growing(img)
Thres1 = 110;
Thres2 = 160;
minimumchange = 1;

Thres1new = 4234;
Thres2new = 345435;
while (Thres1new - Thres1 > minimumchange && Thres2new - Thres2 > minimumchange)
group1 = img <= Thres1;
group2 = img > Thres1;
group4 = group2 < Thres2;
group3 = img > Thres2;

mean1 = mean(img(group1));
mean2 = mean(img(group4));
mean3 = mean(img(group3));

Thres1new = (mean1 + mean2)/2;
Thres2new = (mean2 + mean3)/2;

Thres1 = Thres1new;
Thres2 = Thres2new;
end
%okay, now we have seed intensities. Now what?
%let's make a starting min threshold of like, 10 I don't think things
%differ that much

seed1 = 0;

while seed1 < Thres1 && seed1 ~= 0
idx = randperm(size(img, 1));

seed1 = img(idx,:);

end

seed2 = 0;
while seed2 < Thres2 && seed2 ~= 0 && seed2 > Thres1
idx = randperm(size(img, 1));

seed2 = img(idx,:);

end

seed3 = 0;

while seed3 > Thres2 && seed3 ~= 0
idx = randperm(size(img, 1));

seed3 = img(idx,:);

end

%after some gross clone cloning, we have some seeds from the thresholds
%(previous segments)

%check the regions, bro

RegionThreshold = 10;

%how do we define the neighborhood?

neighborhood = [ -1 0 ; 1 0 ; 0 -1; 0 1]; % this is a 4- pixel neighborhood vector

%we need to keep a memory of the pixels we've seen, how do we do that?

end

