original = imread('image1.jpg');
gray = rgb2gray(original);
hist = histeq(gray);

subplot(2,2,1), imshow(gray), title('input gray image');
subplot(2,2,2), imhist(gray), title('Histogram of input gray image'); 
subplot(2,2,3), imshow(hist), title('Image after equilisation function');
subplot(2,2,4), imhist(hist), title('Histogram after equilisation');