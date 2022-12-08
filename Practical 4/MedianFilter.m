N = 7;
I = imread("Dog1.png");
gray = rgb2gray(I);
I = im2double(gray);

I_pad = padarray(I, [floor(N / 2), floor(N / 2)]); 
I_col = im2col(I_pad, [N, N], 'sliding'); 
sorted_cols = sort(I_col, 1, 'ascend'); 
med_vector = sorted_cols(floor (N*N/2) + 1, :); 
out= col2im(med_vector, [N, N], size(I_pad), 'sliding'); 

subplot(1,3,1); 
imshow(I);
title('Original Image');

subplot(1,3,2); 
imshow(out);
title('Median Filter');

subplot(1,3,3);
imshow(medfilt2(I));
title('Predefined Median Filter');