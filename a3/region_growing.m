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
%okay, now we have seed intensities. Now what?
%let's make a starting min threshold of like, 10 I don't think things
%differ that much
% regions are binary operators.

thresh = multithresh(img, 3);

seg_I = imquantize(img, thresh); % values from 1 - 4

[M,N,~] = size(img);
group1flag = 0;
group2flag= 0;
group3flag = 0;
group4flag = 0;


while group1flag == 0 || group2flag == 0 || group3flag == 0 || group4flag ==0

seed1 = randi([1,M]);
seed2 = randi([1,N]);


if group1flag == 0 && seg_I(seed1, seed2) == 1
    start1 = [seed1, seed2];
    disp(start1);
    group1flag = 1;
    
end

if group2flag == 0 && seg_I(seed1, seed2) == 2
    start2 = [seed1, seed2];
    disp(start2);

    group2flag = 1;
end

if group3flag == 0 && seg_I(seed1, seed2) == 3
    start3 = [seed1, seed2];
    disp(start3);

    group3flag = 1;
end

if group4flag == 0 && seg_I(seed1, seed2) == 4
    start4 = [seed1, seed2];
    disp(start4);
    group4flag = 1;
    
end

end



function [regionmap] = grow(regionmap, RegionThreshold, image, start, groupnumber)

regionmap = zeros(181, 217);
counter = 1; % #of pixels in group
stack = java.util.Stack();
stack.push(start);
visited = zeros(181, 217);
seedpixel = image(start(1),start(2));
disp(seedpixel);
while ~stack.isEmpty()
    workingpixel = stack.pop();      
    if abs(image(workingpixel(1), workingpixel(2)) - seedpixel) <= RegionThreshold % in region
       
        pixel1 = [workingpixel(1) + 1, workingpixel(2)];
        pixel2 = [workingpixel(1) - 1, workingpixel(2)];
        pixel3 = [workingpixel(1), workingpixel(2) + 1];
        pixel4 = [workingpixel(1), workingpixel(2) - 1]; 
        
        if pixel1(1) == 0
            pixel1(1) = pixel1(1) + 1;
        end
        
        if pixel1(2) == 0
            pixel1(2) = pixel1(2) + 1;
        end
        if pixel2(1) == 0
            pixel2(1) = pixel2(1) + 1;
        end
        if pixel2(2) == 0
            pixel2(2) = pixel2(2) + 1;
        end
        if pixel3(1) == 0
            pixel3(1) = pixel3(1) + 1;
        end
        if pixel3(2) == 0
            pixel3(2) = pixel3(2) + 1;
        end
        if pixel4(1) == 0
            pixel4(1) = pixel4(1) + 1;
        end
        if pixel4(2) == 0
            pixel4(2) = pixel4(2) + 1;
        end
        
        
         if pixel1(1) == 182
            pixel1(1) = pixel1(1) - 1;
        end
        
        if pixel1(2) == 218
            pixel1(2) = pixel1(2) - 1;
        end
        if pixel2(1) == 182
            pixel2(1) = pixel2(1) - 1;
        end
        if pixel2(2) == 218
            pixel2(2) = pixel2(2) -1;
        end
        if pixel3(1) == 182
            pixel3(1) = pixel3(1) - 1;
        end
        if pixel3(2) == 218
            pixel3(2) = pixel3(2) - 1;
        end
        if pixel4(1) == 182
            pixel4(1) = pixel4(1) - 1;
        end
        if pixel4(2) == 218
            pixel4(2) = pixel(2) - 1;
        end
        
      
        
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
                        
        regionmap(workingpixel(1), workingpixel(2)) = groupnumber;
        
    end
end

    end

regionmap1 = zeros(181, 217);
regionmap2 = zeros(181, 217);
regionmap3 = zeros(181, 217);% should make this M,N at some point in case sizes change
regionmap4 = zeros(181, 217);

RegionThreshold = 20;

regionmap1 = grow(regionmap1, RegionThreshold, img, start1, 1);
regionmap2 = grow(regionmap2, RegionThreshold, img, start2, 1);
regionmap3 = grow(regionmap3, RegionThreshold, img, start3, 1);
regionmap4 = grow(regionmap4, RegionThreshold, img, start4, 1); %this can be substituted if you want the background real bad


concat = cat(3, regionmap2, regionmap3, regionmap1);


img = mat2gray(concat);



end

