input_image = imread("Dog1.png"); 
input_image = rgb2gray(input_image);
[M, N] = size(input_image); 
FT_img = fft2(double(input_image));
D0 = 30 ; 
n = 2;

u = 0 : (M - 1) ; 
idx= find(u > M / 2);
u(idx) = u(idx) - M;
v = 0 : (N - 1);

idy = find(v > N / 2); 
v(idy) = v(idy) - N;
[V, U] = meshgrid(v, u); 
D = sqrt(U.^2 + V.^2); 
H = (1 + (D / D0).^(2 * n));

H = 1./ H ;
G = H.* FT_img;
out = real(ifft2(double(G)));

subplot(1, 2, 1); 
imshow(input_image);
title('Original Image');

subplot(1, 2, 2); 
imshow(out, []);
title(['Butterworth low pass of order=', num2str(n), 'and cutoff =', num2str(D0)]);