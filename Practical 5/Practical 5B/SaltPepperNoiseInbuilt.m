rgb_img = imread("Garden.jpg");
gray_img = rgb2gray(rgb_img);
noise = imnoise(gray_img, 'salt & pepper', 0.04);
med_filter = medfilt2(noise, [3 3]);

subplot(1,3,1), imshow(gray_img), title("Image With Noise"); 
subplot(1,3,2), imshow(noise), title("Image With Noise");
subplot(1,3,3), imshow(newimage, [0, 255]), title("Image Without Noise");