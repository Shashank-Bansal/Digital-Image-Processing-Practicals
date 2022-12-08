rgb_img = imread("Garden.jpg");
gray_img = rgb2gray(rgb_img);
[x, y] = size(gray_img);
d = 0.04;
I = uint8(gray_img);
noise = imnoise (gray_img, 'salt & pepper', d);
Inew = zeros(x + 2, y + 2);
newimage = zeros(x, y);
for i = 1 : x
    for j = 1 : y
        Inew(i + 1, j + 1) = noise(i, j);
    end
end

for i = 1 : x
    for j = 1 : y
        kernel = zeros(9, 1);
        index = 1;
        sum = 0;
        for p = 1 : 3
            for q = 1 : 3
                kernel(index) = Inew(i + p - 1, j + q - 1);
                index = index + 1;
            end
        end
        median = sort(kernel);
        newimage(i, j) = median(5);
    end
end

subplot(1,3,1), imshow(gray_img), title("Image Without Noise"); 
subplot(1,3,2), imshow(noise), title("Image With Noise");
subplot(1,3,3), imshow(newimage, [0, 255]), title("Image Without Noise");