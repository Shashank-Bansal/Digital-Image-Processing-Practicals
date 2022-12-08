original = imread('Car.jpg');
gray = rgb2gray(original);
I = double(rgb2gray(original));
In = I;

mask1 = [1, 0, -1; 1, 0, -1; 1, 0, -1];
mask2 = [1, 1, 1; 0, 0, 0; -1, -1, -1];
mask3 = [0, -1, -1; 1, 0, -1; 1, 1, 0];
mask4 = [1, 1, 0; 1, 0, -1; 0, -1, -1];

rot90(mask1, 2);
rot90(mask2, 2);
rot90(mask3, 2);
rot90(mask4, 2);

for i = 2 : size(I, 1) - 1
    for j = 2 : size(I, 2) - 1
        neighbour_matrix1 = mask1.* In(i - 1 : i + 1, j - 1 : j + 1);
        avg_value1 = sum(neighbour_matrix1(:));

        neighbour_matrix2 = mask2.* In(i - 1 : i + 1, j - 1 : j + 1);
        avg_value2 = sum(neighbour_matrix2(:));

        neighbour_matrix3 = mask3.* In(i - 1 : i + 1, j - 1 : j + 1);
        avg_value3 = sum(neighbour_matrix3(:));

        neighbour_matrix4 = mask4.* In(i - 1 : i + 1, j - 1 : j + 1);
        avg_value4 = sum(neighbour_matrix4(:));

        I(i,j) = max([avg_value1, avg_value2, avg_value3, avg_value4]);
    end
end

subplot(1,2,1), imshow(gray), title('Gray Scale Image');
subplot(1,2,2), imshow(uint8(I)), title('Edge Detection Output');