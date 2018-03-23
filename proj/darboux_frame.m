function [u,v,w, target, source, normaltarget] = darboux_frame(pi ,pj, ni, nj)
%DARBOUX_FRAME Summary of this function goes here
%   Detailed explanation goes here
%WE have to find the point with the lowest angle to the line between the
%two points
%this takes in a point and a k-neighbour, and calculates the uvn box


theta1 = acosd(dot(ni, (pj - pi))); %angle of i's normal to line
theta2 = acosd(dot(nj, (pi - pj))); %angle of j's normal

if theta1 <= theta2 %j is less, swap vectors
    source = pi;
    normalsource = ni;
    target = pj;
    normaltarget = nj;
else
    source = pj;
    normalsource = nj;
    target = pi;
    normaltarget = ni ;
end




u = normalsource;
v = cross((target - source), u);
w = cross(u,v);


end

