function [alpha,phi, theta] = angular_variations(u, v, w, nj, pi, pj)
%ANGULAR_VARIATIONS Summary of this function goes here
%   Detailed explanation goes here
%these are the point pair features in 3-d space
alpha = dot(v, nj);
phi = (dot(u, (pj - pi)))/norm(pj - pi);
theta = atan2(dot(w, nj), dot(u, nj));

end

