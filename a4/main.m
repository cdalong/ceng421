img = imread('nuclei.tif');
nhood = ones(3);
f = img;
a = 3;
b = 1.5;

output1 = mylocalthresh(f, nhood, a, b, 'local');
output2 = mylocalthresh(f, nhood, a, b, 'global');





figure
subplot(1,3,1), imshow(img);
title("Original");
subplot(1,3,2), imshow(output1);
title("Local Threshold");
subplot(1,3,3), imshow(output2);
title("Global Threshold");


h = mypostprocessing(output1,'close', nhood);

g = mypostprocessing(h, 'open', ones(2));

figure
subplot(1,3,1), imshow(output1);
title("Local Thresholded Image");
subplot(1,3,2), imshow(h);
title("Closed Image");
subplot(1,3,3), imshow(g);
title("Opened the Closed image");

