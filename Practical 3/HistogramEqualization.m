original = imread('image1.jpg'); 
[row, col] = size(original);
numofpixels = uint64(row* col);

freq = zeros(1, 256); 
out = zeros(1, 256);
cf = uint64(0); 

for x = 1:row
    for y = 1:col
        i = original(x,y); 
        freq(i+1) = freq (i+1) + 1;
    end
end 

for x = 1:256
    cf = cf + freq(x);
    cdf = double (cf) / double (numofpixels)* 255.0;
    out(x) = uint8(round(cdf));
end

eq_img = uint8(zeros(row, col));

for x = 1:row
    for y = 1:col
        eq_img(x,y) = out(original (x,y) + 1);
    end
end

subplot (2,2,1), imshow(original), title('Original Image');
subplot (2,2,2), imshow(eq_img), title('Image after Equalization'); 
subplot (2,2,3), imhist (original), title("Original Histogram"); 
subplot (2,2,4), imhist (eq_img), title("After Histogram Equalization");