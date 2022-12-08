rgb = imread('image1.jpg');
gray = rgb2gray(rgb);

%Average Filter 
h = fspecial( 'average', [9,9]);
avgf = imfilter(rgb,h);

%Max Filter
maxf = ordfilt2(gray, 25, true (5));

%Min filter
minf = ordfilt2(gray,1, true (5));

%Median filter
medianf = ordfilt2(gray,13, true(5));

%Gaussian filter 
gaussianf = imgaussfilt(rgb);

%Sobel filter
h1 = fspecial('sobel');
sobelf = imfilter(rgb, h1);

%Laplacian filter
h2 = fspecial('laplacian'); 
laplacianf = imfilter(rgb, h2);

subplot(3,3,1), imshow(rgb), title('Input RGB image');
subplot(3,3,2), imshow(gray), title('Grayscale image');
subplot(3,3,3), imshow(avgf), title('Average Filter'); 
subplot(3,3,4), imshow(maxf), title('Max Filter');
subplot(3,3,5), imshow(minf), title('Min Filter');
subplot(3,3,6), imshow(medianf), title ('Median Filter'); 
subplot(3,3,7), imshow(gaussianf),title('Gaussian Filter');
subplot(3,3,8), imshow(sobelf), title('Sobel Filter');
subplot(3,3,9), imshow(laplacianf), title('Laplacian Filter');