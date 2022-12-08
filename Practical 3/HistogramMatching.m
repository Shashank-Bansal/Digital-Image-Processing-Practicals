img1 = imread('image1.jpg');
[row, col] = size(img1); 
numofpixels = uint64(row * col);
freq = zeros(1, 256);
out1 = zeros(1, 256);
cf = uint64(0);

for x = 1:row
    for y = 1:col 
        i= img1(x,y);
        freq(i + 1) = freq(i + 1) + 1;
    end
end

for x = 1:256
    cf = cf + freq(x);
    cdf = double(cf) / double(numofpixels) * 255.0;
    out1(x) = uint8(round(cdf)); 
end

img2 = imread('sunset1.jpg'); 
[row, col] = size(img2);
numofpixels = uint64(row * col);
freq = zeros(1, 256);
out2 = zeros(1, 256);
cf = uint64(0);

for x = 1:row
    for y = 1:col
        i = img2(x,y); 
        freq(i + 1) = freq(i + 1) + 1;
    end
end

for x = 1:256
    cf = cf + freq(x);
    cdf = double(cf) / double (numofpixels) * 255.0; 
    out2(x) = uint8(round(cdf));
end

match = zeros(1, 256); 
for x = 1:256
    for y = 1:256
        if out1(x) <= out2(y) 
            match(x) = y- 1;
        break
        end
    end
end

out_img = uint8(zeros(size(img1)));

for i = 1:numel(img1) 
    out_img(i) = match(img1(i) + 1);
end

subplot(2,3,1), imshow(img1), title("Input Image"); 
subplot(2,3,2), imshow(img2), title('Target Image');
subplot(2,3,3), imshow(out_img), title("Output Image"); 
subplot(2,3,4), imhist(img1), title("Input Histogram");
subplot(2,3,5), imhist(img2), title("Target Histogram");
subplot(2,3,6), imhist(out_img), title("Output Histogram");