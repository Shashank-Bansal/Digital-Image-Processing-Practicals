color = imread('Building.png');
orig_img = rgb2gray(color);
img = im2double(orig_img);
thresh = 0.5; 
old_thresh = 1.0;

while abs(thresh-old_thresh) > 0.1
    l = img > thresh;
    temp = (img.* double(1)); 
    m1 = sum(temp(:)) / sum(l(:) == 1);
    l = double(l) == 0;
    temp = (img.* double(l)); 
    m2 = sum(temp(:)) / sum(l(:) == 1);
    old_thresh = thresh;
    thresh = (m1 + m2) / 2;
end

out1 = img > thresh;

subplot(1,3,1), imshow(color), title('Original Image'); 
subplot(1,3,2), imshow(orig_img), title('Grayscale Image'); 
subplot(1,3,3), imshow(out1), title('Global Thresholding');