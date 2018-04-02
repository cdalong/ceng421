

%currentfilename = files(clouds).name;    
%currentfilepath = files(clouds).folder;

%filetoread = strcat(currentfilepath, '\', currentfilename);
    
ptCloud = pcread("./drill/data/drill_1.6mm_330_cyb.ply");
radius = 0.00055;

[uniquevals, globalstddev,globalmeanhists, distances] = ppfh(ptCloud, radius, 'eucl');


[uniquevals2, globalstddev2,globalmeanhists2, distances2] = ppfh(ptCloud, 0.00075, 'eucl');



[uniquevals3, globalstddev3,globalmeanhists3, distances3] = ppfh(ptCloud, 0.001, 'eucl');


vals1 = get_persistant_features(distances, uniquevals,1.0);
vals2 = get_persistant_features(distances2, uniquevals2,1.0);
vals3 = get_persistant_features(distances3, uniquevals3,1.0);



%uniquevals2 = ppfh(ptCloud, 0.001, 'man');

%unquevals3  = ppfh(ptCloud, 0.00125, 'man');

%estimate the surface normals of the point cloud?

%{
normals = pcnormals(ptCloud) returns a matrix that 
stores a normal for each point in the input ptCloud. 
The function uses six neighboring points to fit a local plane
 to determine each normal vector.

Can use a k parameter to determine the number of points to use 
in local plane fitting
%}


%{

%figure
%pcshow(ptCloud); % well that was easy
x = ptCloud.Location(1:end,1);
y = ptCloud.Location(1:end,2);
z = ptCloud.Location(1:end,3);
u = normals(1:end,1);
v = normals(1:end,2);
w = normals(1:end,3);
%quiver3(x,y,z,u,v,w);

%}




%bar(mestd_anhist);

%for every pair of points in the redius (they have to be different)
% 1.Take their estimated normals, ni and nj
% 2.pi has a smaller angle to the line connecting the two points
% 3. Calculate the following values : alpha phi and theta. 
% These three points, plus the euclidean distance of the two points, will
% give you the freature space.
% use pdist for the Euclidean distance

%once we have the set of features, as compute from above then
%Use the formula from 4) to do the FPFH of a given point.


%Once we have a working FPFH, do some persistence analysis. This analysis
%looks at points that haven't changed when you vary the radius of the
%k-neighbours part

%At the end, they look at noisy datasets. Try that too?



