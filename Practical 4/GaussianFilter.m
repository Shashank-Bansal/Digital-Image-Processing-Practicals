N = 5;
sigma = 2;

ind = -floor(N/2) : floor(N/2);
[X, Y] = meshgrid(ind, ind);
h = exp(-(X.^2 + Y.^2) / (2 * sigma * sigma));
h = h / sum(h(:));

h = h(:);
I = imread('Dog1.png');
gray = rgb2gray(I);
I = im2double(gray);

I_pad = padarray(I, [floor(N / 2) floor(N / 2)]);
C = im2col(I_pad, [N N], 'sliding');
C_filter = sum(bsxfun(@times, C,h), 1); 
out = col2im(C_filter, [N N], size(I_pad), 'sliding');

subplot(1,3,1); 
imshow(I);
title('Original Image');

subplot(1,3,2); 
imshow(out); 
title('Guassian filter');

subplot(1,3,3); 
imshow(imfilter(I, fspecial('gaussian', 7, 2))); 
title('Predefined Guassian Filter');