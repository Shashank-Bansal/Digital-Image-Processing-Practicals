color = imread("Building.png");
orig_img = rgb2gray(color); 
img = im2double (orig_img);
avg = imfilter(orig_img, fspecial('average', 159), 'replicate');
sub = orig_img - avg;
out2 = imbinarize(sub, 0); 

subplot(1,3,1), imshow(color), title("Original Image"); 
subplot(1,3,2), imshow(orig_img), title("Grayscale Image")
subplot(1,3,3), imshow(out2), title("Local Adaptive Thresholding")