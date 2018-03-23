function [hist] = compute_features(point, ptCloud, normals, radius)
%COMPUTE_FEATURES Summary of this function goes here
%   Detailed explanation goes here

pointx  = ptCloud.Location(point,1);
pointy = ptCloud.Location(point,2); 
pointz = ptCloud.Location(point,3);

P = [pointx, pointy, pointz];

[indices,dists] = findNeighborsInRadius(ptCloud,P,radius);
combos = nchoosek(indices, 2);

features = zeros(length(combos), 4);
for n = 1:size(combos,1) %returns longest length. if not it errors

    p1 = [ptCloud.Location(combos(n,1),1) , ptCloud.Location(combos(n,1),2), ptCloud.Location(combos(n,1),3) ];
    p2 = [ptCloud.Location(combos(n,2),1) , ptCloud.Location(combos(n,2),2), ptCloud.Location(combos(n,2),3) ];
    
    n1 = [normals(combos(n,1),1), normals(combos(n,1),2), normals(combos(n,1),3)];
    n2 = [normals(combos(n,1),1), normals(combos(n,1),2), normals(combos(n,1),3)];

    
    [u,v,w, target, source, normaltarget] = darboux_frame(p1, p2, n1, n2);
    
    [f1, f2, f3, f4] = angular_variations(u ,v, w, target, source, normaltarget);
    
    features(n, 1) = f1;
    features(n, 2) = f2;
    features(n, 3) = f3;
    features(n, 4) = f4;
    
end

hist = bin_values(features, radius);



end

