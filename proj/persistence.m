ptCloud = pcread("./bunny/data/bun000.ply");

normals = pcnormals(ptCloud);

%need to pick three radii, and if the points are in the range of all three,
%then they are unique features.

normalsgpu = gpuArray(normals);
ptCloudgpu = gpuArray(ptCloud.Location);

radius = 0.002;

histlist = gpuArray([]);
javamap = java.util.HashMap();
avg = [];

for point = 1:2

disp(point);
P = [ptCloud.Location(point,1), ptCloud.Location(point,2),ptCloud.Location(point,3)];

pgpu = gpuArray(P);
    
[indices,dists] = findNeighborsInRadius(ptCloud,P,radius); %use this

for n = 1:length(indices)

    hist = compute_featuresgpu(indices(n), ptCloud, ptCloudgpu, normals, radius);
    hist = gather(hist);
    %so what exactly was I doing again? Now that I have this in gpu
    % I need the list of points and thier histograms
    % so let's get a list in order of point # and histogram
    avg = [avg;hist];    
  
end
pointhist = get_mean_hist(avg);

javamap.put(point, pointhist);

disp(javamap.keySet());

end

%now that we have a local histogram, in a java map, we have to compare the
%histograms to the distance type. 
% in other words, pop the point out of the dictionary if it is not "unique"




