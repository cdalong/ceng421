close all
clear
img1 = im2double(imread('apple.jpg'));
img2 = im2double(imread('orange.jpg')); 
num_levels = 4;
alpha = 0.4;

blendedimg = myblend(img1, img2, num_levels, alpha);
figure,imshow(blendedimg) 
