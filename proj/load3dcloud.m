ptCloud = pcread("./bunny/data/bun000.ply");


%estimate the surface normals of the point cloud?

%{
normals = pcnormals(ptCloud) returns a matrix that 
stores a normal for each point in the input ptCloud. 
The function uses six neighboring points to fit a local plane
 to determine each normal vector.

Can use a k parameter to determine the number of points to use 
in local plane fitting
%}

normals = pcnormals(ptCloud);

figure
pcshow(ptCloud); % well that was easy
x = ptCloud.Location(1:end,1);
y = ptCloud.Location(1:end,2);
z = ptCloud.Location(1:end,3);
u = normals(1:end,1);
v = normals(1:end,2);
w = normals(1:end,3);

quiver3(x,y,z,u,v,w);