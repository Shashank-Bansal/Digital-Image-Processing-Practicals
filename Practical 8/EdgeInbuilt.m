I = imread('Car.jpg');
gray = rgb2gray(I);
canny = edge(gray, 'canny');
prewitt = edge (gray, 'prewitt');
sobel = edge(gray, 'sobel');
roberts = edge (gray, 'roberts');

subplot(3,2,1), imshow(gray); title("Gray Scale Image"); 
subplot(3,2,2), imshow(canny); title("canny edge detection");
subplot(3,2,3), imshow(prewitt); title("prewitt edge detection");
subplot(3,2,4), imshow(sobel); title("sobel edge detection");
subplot(3,2,5), imshow(roberts); title("roberts edge detection");