img = imread("image.jpg");

gray = rgb2gray(img);
% gray = im2gray(img);
blackWhite = im2bw(img);

subplot(1,3,1);
imshow(img);
title("Original Image");

subplot(1,3,2);
imshow(gray);
title("Original to GrayScale");

subplot(1,3,3);
imshow(blackWhite);
title("Original to BlackAndWhite");

whos("gray");
whos("blackWhite");

imwrite(gray, "GrayScale.jpg");
imwrite(blackWhite, "blackWhite.jpg");