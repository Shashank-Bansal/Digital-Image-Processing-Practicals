img = imread('image.jpg');
gray = rgb2gray(img);
img1 = imbinarize(gray);
subplot(1,2,1), imshow(img), title('Original Image');
subplot(1,2,2), imshow(img1), title('Threshold Image');