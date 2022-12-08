I = imread('image.jpg');
MP = 255;
a = min(I(:));
b = max(I (:));

R = b - a;
out = floor((I - a)/R)*MP;

subplot(1,2,1);
imshow(I);
title('Original Image');

subplot (1,2,2);
imshow (out);
title('Contrast Stretching Implementation');