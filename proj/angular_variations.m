function [f1,f2, f3, f4] = angular_variations(u, v, w, target, source, normaltarget)
%ANGULAR_VARIATIONS Summary of this function goes here
%   Detailed explanation goes here
%these are the point pair features in 3-d space


%{

this is the fpfh
alpha = dot(v, nj);
phi = (dot(u, (pj - pi)))/norm(pj - pi);
theta = atan2(dot(w, nj), dot(u, nj));

%}

f1 = dot(v,normaltarget);
f2 = norm (target - source);
f3 = dot(u, (target  - source)) /f2;
f4 = atan2(dot(w, normaltarget), dot(u, normaltarget));



end

