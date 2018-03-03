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

% regions are binary operators.
[M,N,~] = size(img);

group1flag = 0;
group2flag= 0;
group3flag = 0;


while group1flag == 0 || group2flag == 0 || group3flag == 0

seed1 = randi([1,M]);
seed2 = randi([1,N]);


if group1flag == 0 && group1(seed1, seed2) == 1
    start1 = [seed1, seed2];
    disp(start1);
    group1flag = 1;
    
end

if group2flag == 0 && group4(seed1, seed2) == 1
    start2 = [seed1, seed2];
    disp(start2);

    group2flag = 1;
end

if group3flag == 0 && group3(seed1, seed2) == 1
    start3 = [seed1, seed2];
    disp(start3);

    group3flag = 1;
end

end
%after some gross clone cloning, we have some seeds from the thresholds
%from each region
%(previous segments)
RegionThreshold = 10;
stack = java.util.Stack();
startingarray = [start1, start2, start3];
counter = 1; % #of pixels in group
vectorsum = img(start1(1),start1(2));

global regionmap; 
global visited;
visited = zeros(181, 271);
regionmap = zeros(181, 271);
stack.push(start1);
groupavg = img(start1(1),start1(2));

while ~stack.isEmpty()
    workingpixel = stack.pop();
    
    disp(img(workingpixel(1), workingpixel(2)));
    if abs(img(workingpixel(1), workingpixel(2)) - groupavg) <= RegionThreshold % in region
       
        pixel1 = [workingpixel(1) + 1, workingpixel(2)];
        pixel2 = [workingpixel(1) - 1, workingpixel(2)];
        pixel3 = [workingpixel(1), workingpixel(2) + 1];
        pixel4 = [workingpixel(1), workingpixel(2) - 1]; 
        
        if visited(pixel1(1), pixel1(2)) == 0
            
        stack.push(pixel1);
        visited(pixel1(1), pixel1(2)) = 1;
        end
        if visited(pixel2(1), pixel2(2)) == 0
            
        stack.push(pixel2);
        visited(pixel2(1), pixel2(2)) = 1;
        end
         if visited(pixel3(1), pixel3(2)) == 0 
        stack.push(pixel3);
        visited(pixel3(1), pixel3(2)) = 1;
         end
         if visited(pixel4(1), pixel4(2)) == 0  
        stack.push(pixel4);
        visited(pixel4(1), pixel4(2)) = 1;
         end
        counter = counter + 1;
        
        vectorsum = vectorsum + img(workingpixel(1), workingpixel(2));
        
        groupavg = vectorsum/counter;
        
        regionmap(workingpixel(1), workingpixel(2)) = 1;
        
    end
end

disp(regionmap);

%for each starting pixel, do some region growing

%check the regions, bro


%how do we define the neighborhood?

%neighborhood = [ -1 0 ; 1 0 ; 0 -1; 0 1]; % this is a 4- pixel neighborhood vector

%we need to keep a memory of the pixels we've seen, how do we do that?

%let's try a queue


end

