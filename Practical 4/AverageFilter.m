N = 7;
filter = ones(N);
filter = filter / sum(filter(:));
I = rgb2gray(imread('Dog1.png'));
I = im2double(I);
out = convn(I, filter, 'same');

subplot(1,3,1);
imshow(I);
title('Original Image');

subplot(1,3,2);
imshow(out);
title('Average Filter');

subplot(1,3,3);
imshow(imfilter(I, fspecial('average', 7))); 
title('Predefined Average Filter');