%This is just a sample main file for my sake, to edit variables

close all
clear
img1 = im2double(imread('apple.jpg'));
img2 = im2double(imread('orange.jpg')); 
num_levels = 4;
alpha = 0.5;
img1 = imresize(img1,[size(img2,1) size(img2,2)]);

blendedimg = myblend(img1, img2, num_levels, alpha);
figure,imshow(blendedimg) 