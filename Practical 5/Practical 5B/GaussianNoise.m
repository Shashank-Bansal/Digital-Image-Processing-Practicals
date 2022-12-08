rgb_img = imread('Garden.jpg');
gray_img = rgb2gray(rgb_img);
noise_img = imnoise(gray_img, 'Gaussian', 0.04, 0.003);

I = double(noise_img);
sigma = 1.76;
sz = 4;
[x,y] = meshgrid(-sz:sz, -sz:sz);
M = size(x, 1) - 1;
N = size(y, 1) - 1;
Exp_comp = -(x.^ 2 + y.^ 2) / (2 * sigma * sigma);
Kernel = exp(Exp_comp) / (2 * pi * sigma * sigma);
Output = zeros(size(I));
I = padarray(I, [sz sz]);

for i = 1 : size(I, 1) - M
    for j = 1 : size(I, 2) - N
        Temp = I(i : i + M, j : j + M).* Kernel;
        Output(i, j) = sum(Temp(:));
    end
end

Output = uint8(Output);
subplot(1,3,1), imshow(Output), title('Original');
subplot(1,3,2), imshow(noise_img), title('Image with Noise');
subplot(1,3,3), imshow(Output), title('After Noise Removal');