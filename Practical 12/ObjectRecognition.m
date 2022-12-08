ip=imread('Target.png');
ip_image=rgb2gray(ip);
figure;
imshow(ip_image);
title('Image of an object');
scene=imread('Traffic.jpg');
sc_image=rgb2gray(scene);
figure;
imshow(sc_image);
title('Image of a Scene');
 
ip_points = detectSURFFeatures(ip_image);
sc_points = detectSURFFeatures(sc_image);
figure;
imshow(ip_image);
title('100 Strongest Feature Points from Input Image');
hold on;
plot(selectStrongest(ip_points,100));
figure;
imshow(sc_image);
title('300 Strongest Feature Points from Scene Image');
hold on;
plot(selectStrongest(sc_points,300));
 
[ipfeatures, ip_points]=extractFeatures(ip_image,ip_points);
[scfeatures, sc_points]=extractFeatures(sc_image,sc_points);
 
ipPairs=matchFeatures(ipfeatures,scfeatures);
matchedip_points=ip_points(ipPairs(:,1),:);
matchedsc_points=sc_points(ipPairs(:,2),:);
 
figure;
showMatchedFeatures(ip_image,sc_image,matchedip_points,matchedsc_points, 'montage');
title('Putatively Matched Points (Including Outliers)');
 
[tform, inlierip_points,inliersc_points]=estimateGeometricTransform(matchedip_points, matchedsc_points, 'affine');
figure;
showMatchedFeatures(ip_image,sc_image,inlierip_points,inliersc_points, 'montage');
title('Putatively Matched Points (Inliers Only)');
 
ipPolygon=[1,1; size(ip_image,2),1;size(ip_image,2),size(ip_image,1);1,size(ip_image,1);1,1];
 
newipPolygon=transformPointsForward(tform, ipPolygon);
figure;
imshow(sc_image);
hold on;
line(newipPolygon(:,1),newipPolygon(:,2),'Color','g');
title('Detected object');