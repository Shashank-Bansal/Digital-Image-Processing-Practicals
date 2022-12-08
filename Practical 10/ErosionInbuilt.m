img=imread("Car.jpg");
originalBW=im2bw(img);
se=strel('line',11,90); 
erodedBW= imerode(originalBW,se);
subplot (1,3,1), imshow(img), title('Original Image');
subplot(1,3,2), imshow(originalBW), title('Black & White Image');
subplot(1,3,3), imshow(erodedBW), title('Inage after Erosion');