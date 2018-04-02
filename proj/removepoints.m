
C = intersect(vals1, vals2);
D = intersect(C, vals3);
dvalues = [];
values = [];

for point = 1:size(D)
   
  values = [ptCloud.Location(D(point), 1),ptCloud.Location(D(point), 2), ptCloud.Location(D(point), 3)] ;
   
  dvalues = [dvalues; values];
    
end

perstptcloud = pointCloud(dvalues);


figure
subplot(1,2,1), pcshow(ptCloud);
subplot(1,2,2), pcshow(perstptcloud);
