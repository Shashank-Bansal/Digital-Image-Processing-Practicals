ip = imread('Car.jpg');
m = [-1, -1, -1; -1, 8, -1; -1, -1, -1];
n = [-1, -1, -1; 2, 2, 2;  -1,  -1, -1]; 
x = rgb2gray(ip);
g = abs (imfilter(double(ip), m)); %point detection
SE = strel('arbitrary', eye(5));
j = imerode(ip, SE); %boundary detection
imshow(ip), title('Input Image');

subplot(1,3,1), imshow(ip), title('original image');
subplot(1,3,2), imshow(g), title('Point Detection');
subplot(1,3,3), imshow(j), title('Boundary Detection')