f = rgb2gray(im2double(imread('View.jpg')));
f = imresize(f,[256 256]);
subplot(2,3,1), imshow(f), title('Original');

[M,N] = size(f);
h = fspecial('gaussian', 260, 2);
g = (imfilter(f, h, 'circular'));
subplot(2,3,2), imshow(g, []), title('Circular');

G = fftshift(fft2(g));
subplot(2,3,3), imshow(log(abs(G)), []), title('Circular FFT');

H = fftshift(fft2(h));
subplot(2,3,4), imshow(log(abs(H)), []), title('Gaussian FFT');

F = zeros(size(f));
R = 70;
for u = 1 : size(f, 2)
    for v = 1 : size(f, 1)
        du = u - size(f, 2) / 2;
        dv = v - size(f, 1) / 2;
        if du ^ 2 + dv ^ 2 <= R ^ 2
            F(v, u) = G(v, u)./ H(v, u);
        end
    end
end

subplot(2,3,5), imshow(log(abs(F)), []), title('Noise Model');

fRestored = abs(ifftshift(ifft2(F)));
subplot(2,3,6), imshow(fRestored, []), title('Restored Image');