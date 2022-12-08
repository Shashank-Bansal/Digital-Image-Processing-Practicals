img = imread('image.jpg');
gray = rgb2gray(img);
[m, n] = size(gray);

for i = 1:m
    for j = 1:n
        if img(i,j) >= 125 
            gray(i,j) = 255;
        else
            gray(i,j) = 0;
        end
    end
end

subplot (1,2,1), imshow(img), title('Original Image');
subplot (1,2,2), imshow(gray), title('Threshold Image');