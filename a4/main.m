img = imread('nuclei.tif');



nhood = ones(3);


f = img;


a = 3;
b = 1.5;

output1 = mylocalthresh(f, nhood, a, b, 'local');
output2 = mylocalthresh(f, nhood, a, b, 'global');

figure
imshow(output1);

figure
imshow(output2);