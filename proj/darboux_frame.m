function [u,v,w] = darboux_frame(pi ,pj, ni)
%DARBOUX_FRAME Summary of this function goes here
%   Detailed explanation goes here
%WE have to find the point with the lowest angle to the line between the
%two points
%this takes in a point and a k-neighbour, and calculates the uvn box

u = ni;
v = cross((pj - pi), u);
w = cross(u,v);

disp(u);
disp(v);
disp(w);

end

