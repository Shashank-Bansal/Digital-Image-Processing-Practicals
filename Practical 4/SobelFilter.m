filter_x = [-1 -2 -1; 0 0 0; 1 2 1]; 
filter_y = [-1 0 1; -2 0 2; -1 0 1];
I = imread("Dog1.png");
gray = rgb2gray(I);
I = im2double(gray);

G_x = conv2(I, filter_x, 'same'); 
G_y = conv2(I, filter_y, 'same');
pre_hor = imfilter(I, fspecial("sobel"));
pre_ver = imfilter(I, fspecial('sobel'));

subplot(3,3,1); 
imshow(I);
title("Original Image");

subplot(3,3,2);
imshow(G_x); 
title('Sobel Filter (Horizontal)');

subplot(3,3,3); 
imshow(pre_hor); 
title('Predefined Sobel Filter (Horizontal)');

subplot (3,3,5); 
imshow(G_y);
title('Sobel Filter (Vertical)');

subplot(3,3,6); 
imshow(pre_ver);
title("Predefined Sobel Filter (Vertical)");

subplot(3,3,8); 
imshow(sqrt(G_x.^2+G_y.^2)); 
title("Sobel filter");

subplot(3,3,9); 
imshow(sqrt(pre_hor.^2+ pre_ver.^2));
title("Predefined Sobel Filter");