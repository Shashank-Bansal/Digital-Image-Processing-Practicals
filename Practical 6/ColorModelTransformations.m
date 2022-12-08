ip = imread('Ocean.jpg');
cmy_ip = imcomplement(ip);
hsi_ip = rgb2hsv(ip);
ycbcr_ip = rgb2ycbcr(ip);
hsi_ip = hsv2rgb(hsi_ip);
ycbcr_ip = ycbcr2rgb(ycbcr_ip);

subplot(3,3,1), imshow(ip), title('Input Image');
subplot(3,3,2), imshow(cmy_ip), title('RGB to CMY');
subplot(3,3,3), imshow(imcomplement(cmy_ip)), title('CMY to RGB');

subplot(3,3,4), imshow(ip), title('Input Image');
subplot(3,3,5), imshow(hsi_ip), title('RGB to HSI');
subplot(3,3,6), imshow(hsi_ip), title('HSI to RGB');

subplot(3,3,7), imshow(ip), title('Input Image');
subplot(3,3,8), imshow(ycbcr_ip), title('RGB to YCbCr');
subplot(3,3,9), imshow(ycbcr_ip), title('YCbCr to RGB');