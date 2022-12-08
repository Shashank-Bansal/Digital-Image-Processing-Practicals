img= imread('Car.jpg');
hello=rgb2gray(img);
I= imbinarize(hello, graythresh(hello));
B=ones(3);
X_close= zeros(size(I), 'logical'); 
Y_close= zeros(size (I), 'logical');
for x= 2:size(I, 1) - 1 
    for y= 2:size(I, 2) - 1
        if (I(x, y)== 1) 
            if any(any(I(x-1:x+1, y-1:y+1) ==B))
                X_close(x-1:x+1, y-1:y+1)= ones(3);
            end
        end
    end
end
for x= 2:size(I, 1) - 1 
    for y= 2:size(I, 2) - 1
        if (X_close(x,y))
            Y_close(x, y) = all(all(X_close(x-1:x+1, y-1:y+1) ==B));
        end
    end
end

subplot(1,3,1), imshow(img), title("Original Image");
subplot(1,3,2), imshow(I), title("Black & White Image");
subplot (1,3,3), imshow(Y_close), title('Closed Image');