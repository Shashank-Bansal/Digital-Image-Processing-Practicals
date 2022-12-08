ip = imread('Car.jpg');
mh = [-1, -1, -1, 2, 2, 2, -1, -1, -1]; %horizontal line
hl = abs(imfilter(double(ip),mh));
mv = [-1, 2, -1, -1, 2, -1, -1, 2, -1]; %vertical line
vl = abs(imfilter(double(ip),mv));
m45 = [2, -1, -1, -1, 2, -1, -1, -1, 2]; %+45
l45 = abs(imfilter(double(ip),m45));
m_45 = [-1, -1, 2, -1, 2, -1, 2, -1, -1];   %-45
lm45 = abs(imfilter(double(ip), m_45));
imshow(ip), title('Input Image');

subplot(2,3,1), imshow(ip), title("original image");
subplot(2,3,2), imshow(hl), title("Horizontal Line Detection");
subplot(2,3,3), imshow(vl), title("Vertical Line Detection"); 
subplot(2,3,4), imshow(l45), title("+45 Degree Line Detection"); 
subplot(2,3,6), imshow(lm45), title("-45 Degree Line Detection");