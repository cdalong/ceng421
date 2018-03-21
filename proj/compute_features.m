function [hist] = compute_features(point, ptCloud, normals)
%COMPUTE_FEATURES Summary of this function goes here
%   Detailed explanation goes here

pointx  = ptCloud.Location(point,1);
pointy = ptCloud.Location(point,2); 
pointz = ptCloud.Location(point,3);

P = [pointx, pointy, pointz];

[indices,dists] = findNeighborsInRadius(ptCloud,P,0.0050);
combos = nchoosek(indices, 2);

features = zeros(length(combos), 4);
for n = 1:length(combos)

    p1 = [ptCloud.Location(combos(n,1),1) , ptCloud.Location(combos(n,1),2), ptCloud.Location(combos(n,1),3) ];
    p2 = [ptCloud.Location(combos(n,2),1) , ptCloud.Location(combos(n,2),2), ptCloud.Location(combos(n,2),3) ];
    
    n1 = [normals(combos(n,1),1), normals(combos(n,1),2), normals(combos(n,1),3)];
    n2 = [normals(combos(n,1),1), normals(combos(n,1),2), normals(combos(n,1),3)];

    
    [u,v,w, pi, pj, ni, nj] = darboux_frame(p1, p2, n1, n2);
    
    [alpha, phi, theta] = angular_variations(u ,v, w, nj, pi, pj);
    
    features(n, 1) = alpha;
    features(n, 2) = phi;
    features(n, 3) = theta;
    features(n, 4) = norm(p1 - p2);
    
end

hist = bin_values(features, 0.0050);



end

