original = imread('image.jpg');
gray = rgb2gray(original);
negative = 255 - original;

subplot(1,3,1);
imshow(original);
title("Original Image");

subplot(1,3,2);
imshow(gray);
title("GrayScale Image");

subplot(1,3,3);
imshow(negative);
title("Negative Image");