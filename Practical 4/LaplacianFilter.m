filter_pos = [0 1 0; 1 -4 1; 0 1 0]; 
filter_neg = -filter_pos; 
I = imread("Dog1.png");
gray = rgb2gray(I);
I = im2double(gray);

G_x = conv2(I, filter_pos, 'same');
G_y = conv2(I, filter_neg, 'same'); 

pre_hor = imfilter(I, fspecial('laplacian'));
pre_ver = imfilter(I, -fspecial('laplacian'));

subplot(2,3,1);
imshow(I); 
title("Original Image");

subplot(2,3,2);
imshow(G_x); 
title('Laplacian Filter (-ve)');

subplot (2,3,3);
imshow(pre_hor); 
title('Predefined Laplacian Filter (+ive)');

subplot(2,3,5);
imshow(G_y);
title('Laplacian Filter (-ive)');

subplot(2,3,6);
imshow(pre_ver); 
title('Predefined Laplacian Filter (+ive)');