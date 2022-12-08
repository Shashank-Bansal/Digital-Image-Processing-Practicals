I = imread('image.jpg');
constrast = imadjust(I, stretchlim(I), []);

subplot (1,2,1);
imshow(I);
title('Original Image');

subplot (1,2,2);
imshow(constrast);
title('Contrast Stretching Implementation');