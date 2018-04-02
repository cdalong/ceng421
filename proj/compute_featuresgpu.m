function [hist] = compute_featuresgpu(point, ptCloud, ptCloudgpu, normals, radius)
%COMPUTE_FEATURESGPU Summary of this function goes here
%   Detailed explanation goes here
pointx  = ptCloud.Location(point,1);
pointy = ptCloud.Location(point,2); 
pointz = ptCloud.Location(point,3);

P = [pointx, pointy, pointz];

[indices,dists] = findNeighborsInRadius(ptCloud,P,radius);
combos = nchoosek(indices, 2);

features = zeros(length(combos), 4);
featuresgpu = gpuArray(features);
for n = 1:size(combos,1) %returns longest length. if not it errors

    try
    p1 = [ptCloudgpu(combos(n,1),1) , ptCloudgpu(combos(n,1),2), ptCloudgpu(combos(n,1),3) ];
    p2 = [ptCloudgpu(combos(n,2),1) , ptCloudgpu(combos(n,2),2), ptCloudgpu(combos(n,2),3) ];
    
    n1 = [normals(combos(n,1),1), normals(combos(n,1),2), normals(combos(n,1),3)];
    n2 = [normals(combos(n,1),1), normals(combos(n,1),2), normals(combos(n,1),3)];

    
    p1gpu = gpuArray(p1);
    p2gpu = gpuArray(p2);
    n1gpu = gpuArray(n1);
    n2gpu = gpuArray(n1);
    
    [u,v,w, target, source, normaltarget] = darboux_framegpu(p1gpu, p2gpu,  n1gpu, n2gpu);
    
    ugpu = gpuArray(u);
    vgpu = gpuArray(v);
    wgpu = gpuArray(w);
    targetgpu = gpuArray(target);
    sourcegpu = gpuArray(source);
    normaltargetgpu = gpuArray(normaltarget);
    
    
    [f1, f2, f3, f4] = angular_variationsgpu(ugpu ,vgpu, wgpu, targetgpu, sourcegpu, normaltargetgpu);
    
    featuresgpu(n, 1) = f1;
    featuresgpu(n, 2) = f2;
    featuresgpu(n, 3) = f3;
    featuresgpu(n, 4) = f4;
    catch error
      continue;
    end
    
end

hist = bin_valuesgpu(featuresgpu, radius);

hist = gpuArray(hist);



end
