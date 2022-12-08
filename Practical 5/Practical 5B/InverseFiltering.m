a = 0.1;
b = 0.1;
T = 1;

i = imread("Garden.jpg");
i = rgb2gray(i);
Fi = fft2(i);
[h, w] = size(Fi);
H = [];

for u = 1 : h
    for v = 1 : w
        A = pi.*(u.*a + v.*b);
        H(u, v) = (T./A).*sin(A).*exp(-1i.*A);
    end
end

Gi = Fi.*H;
gi = ifft2(Gi);
subplot(2,2,1), imshow(i), title('Original');
subplot(2,2,2), imshow(uint8(gi)), title('Modeling estimation motion blur');

Gi1 = fft2(double(gi));
noise = imnoise(zeros(h,w), 'gaussian',0,0.00005);
Fnoise = fft2(noise);
Gnoise = Gi+Fnoise;
gnoise = ifft2(Gnoise);
Fhat = Gnoise ./ H;
fhat = ifft2(Fhat);
subplot(2,2,3), imshow(uint8(fhat)), title('Global Inverse Filtering');

Fhat2 = (Gnoise-Fnoise)./H;
fhat2 = ifft2(Fhat2);
subplot(2,2,4), imshow(uint8(fhat2)), title('Inv Filtering with known noise spectrum');