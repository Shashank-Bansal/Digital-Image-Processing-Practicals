gray =imread('Flower.jpg');
subplot(2,3,1);
imshow(gray);
title('Input Image');
h=fspecial('gaussian',15,9);
g=imfilter(gray,h,'replicate');
BW=im2bw(g,0.7);
subplot(2,3,2);
imshow(BW);
title('Binary Image');
b = bwboundaries(BW, 'noholes');
b=b{1};
bim=bound2im(b,size(BW,1),size(BW,2));
subplot(2,3,3);
imshow(bim);
title('Extracted Boundary');
z=frdescp(b);
 
s546=ifrdescp(z,546);
s546im=bound2im(s546,size(BW,1),size(BW,2));
subplot(2,3,4);
imshow(s546im);
title('546 Fourier Descriptors');
 
s50=ifrdescp(z,50);
s50im=bound2im(s50,size(BW,1),size(BW,2));
subplot(2,3,5);
imshow(s50im);
title('50 Fourier Descriptors');
 
s8=ifrdescp(z,8);
s8im=bound2im(s8,size(BW,1),size(BW,2));
subplot(2,3,6);
imshow(s8im);
title('8 Fourier Descriptors');
 
function image = bound2im(b, M, N)
if size(b,2)~=2
    error('The boundary must be of size np-by-2')
end

b= round(b);
if nargin==1
    Mmin=min(b(:,1))-1;
    Nmin=min(b(:,2))-1;
    H= max(b(:,1))-min(b(:,1))+1;
    W= max(b(:,2))-min(b(:,2))+1;
    M=H+Mmin;
    N=W+Nmin;
end

image =false(M,N);
linearIndex=sub2ind([M,N],b(:,1),b(:,2));
image(linearIndex)=1;
end
 
function z = frdescp(s)
[np, nc] = size(s);
if nc ~= 2 
   error('S must be of size np-by-2.'); 
end
if np/2 ~= round(np/2);
   s(end + 1, :) = s(end, :);
   np = np + 1;
end
 
x = 0:(np - 1);
m = ((-1) .^ x)';
s(:, 1) = m .* s(:, 1);
s(:, 2) = m .* s(:, 2);
s = s(:, 1) + i*s(:, 2);
z = fft(s);
end
 
function s = ifrdescp(z, nd)
np = length(z);
 
if nargin == 1
   nd = np; 
end
 
if np/2~=round(np/2)
    error('length(z) must be an even integer')
elseif nd/2~=round(nd/2)
    error('nd must be an even integer')
end

x = 0:(np - 1);
m = ((-1) .^ x)';

d=(np-nd)/2;
z(1:d) = 0;
z(np - d + 1:np) = 0;
zz = ifft(z);

s(:, 1) = real(zz);
s(:, 2) = imag(zz);
s(:, 1) = m.*s(:, 1);
s(:, 2) = m.*s(:, 2);
end
