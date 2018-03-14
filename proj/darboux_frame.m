function [u,v,w, pi, pj, ni, nj] = darboux_frame(pi ,pj, ni, nj)
%DARBOUX_FRAME Summary of this function goes here
%   Detailed explanation goes here
%WE have to find the point with the lowest angle to the line between the
%two points
%this takes in a point and a k-neighbour, and calculates the uvn box


theta1 = acosd(dot(ni, (pi - pj))); %angle of i's normal to line

theta2 = acosd(dot(nj, (pj-pi))); %angle of j's normal

if theta2 < theta1 %j is less, swap vectors
    temp = pi;
    tempn = ni;
    pi = pj;
    pj = temp;
    ni = nj;
    nj = tempn;
end 

u = ni;
v = cross((pj - pi), u);
w = cross(u,v);

disp(u);
disp(v);
disp(w);

end

