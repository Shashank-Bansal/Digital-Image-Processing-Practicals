rgb_img = imread('Garden.jpg');
gray_img = rgb2gray(rgb_img);
noise_img = imnoise(gray_img, 'Gaussian', 0.04, 0.003);

H = fspecial('Gaussian', [9 9], 1.76);
out_img = imfilter(noise_img, H);

subplot(1,3,1), imshow(gray_img), title('Original');
subplot(1,3,2), imshow(noise_img), title('Image with Noise');
subplot(1,3,3), imshow(out_img), title('After Noise Removal');