original = imread('image1.jpg'); 
gray = rgb2gray(original);
c = zeros(1,256); 
[row, col] = size(gray);

for x = 1:1:row
    for y = 1:1:col
        if gray(x,y) < 1
            continue;
        else
            t = gray(x,y);
        end
        c(t) = c(t) + 1;
    end
end

subplot(1,2,1), imshow(uint8(gray)), title("Original Image"); 
subplot(1,2,2), bar(c), title("Histogram");