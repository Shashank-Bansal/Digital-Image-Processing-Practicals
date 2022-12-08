img = imread("Building.png");
[m, n] = size(img);

scale_factor = 3;
out = zeros(m * scale_factor, n * scale_factor, "uint8");

for i = 1 : m * scale_factor
    for j = 1 : n * scale_factor
    p = ceil(i / scale_factor);
    q = ceil(j / scale_factor); 
    out(i, j) = img(p, q);
    end
end

subplot(1,1,1), imshow(out), title("Magnified Image");