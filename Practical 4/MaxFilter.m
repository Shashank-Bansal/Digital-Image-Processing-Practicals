N = 7;
I = imread('Dog1.png');
gray = rgb2gray(I);
I = im2double(gray);
I_pad = padarray(I, [floor(N / 2), floor(N / 2)]);
I_col = im2col(I_pad, [N, N], 'sliding');

max_vector = max(I_col);
out = col2im(max_vector, [N, N], size(I_pad), 'sliding');

subplot(1,3,1);
imshow(I);
title('Original Image')

subplot(1,3,2);
imshow(out);
title('Max Filter');

subplot(1,3,3);
imshow(ordfilt2(I, 49, true(7)));
title('Predefined Max Filter');