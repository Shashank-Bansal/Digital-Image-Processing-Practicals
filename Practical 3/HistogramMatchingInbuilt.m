A = imread('image1.jpg'); 
R = imread('sunset1.jpg');
B = imhistmatch(A, R);

subplot (2,3,1), imshow(A), title('Original image');
subplot (2,3,2), imshow(R), title('Reference image');
subplot (2,3,3), imshow(B), title('Histogram matched image');
subplot (2,3,4), imhist(A), title('Histogram of original image');
subplot (2,3,5), imhist(R), title('Histogram of reference image');
subplot (2,3,6), imhist(B), title('Histogram of matched image');