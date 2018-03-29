img = imread('nuclei.tif');



nhood = ones(3);


f =img;


mean = mylocalmean(f, nhood);