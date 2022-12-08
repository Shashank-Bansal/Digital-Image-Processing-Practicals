img= imread('Car.jpg');
hello=rgb2gray(img);
I= imbinarize(hello, graythresh(hello));
B=ones(3);
X_op= zeros(size(I), 'logical'); 
Y_op= zeros(size (I), 'logical');
for x= 2:size(I, 1) - 1 
    for y= 2:size(I, 2) - 1
        if (I(x, y))
            X_op(x, y) = all(all(I(x-1:x+1, y-1:y+1) ==B));
        end
    end
end
for x= 2:size(I, 1) - 1 
    for y= 2:size(I, 2) - 1
        if (X_op(x, y)== 1) 
            if any(any(X_op(x-1:x+1, y-1:y+1) ==B))
                Y_op(x-1:x+1, y-1:y+1)= ones(3);
            end
        end
    end
end

subplot(1,3,1), imshow(img), title("Original Image");
subplot(1,3,2), imshow(I), title("Black & White Image");
subplot (1,3,3), imshow(Y_op), title('Opened Image');