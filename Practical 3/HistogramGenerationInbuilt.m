original = imread('image1.jpg');
grayImg = rgb2gray(original);

subplot(1,3,1), imshow(original), title('Original Image');
subplot(1,3,2), imshow(grayImg), title('Gray Image'); 
subplot(1,3,3), imhist(grayImg), title('Histogram');