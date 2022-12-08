I = imread("image.jpg");
subplot(1,3,1);
imshow(I);
title("Original Image");

subplot(1, 3, 2);
imshow(255 - I);
title("Negative transformation");

subplot(1, 3, 3);
imshow(imcomplement(I));
title("Imcomplement function");