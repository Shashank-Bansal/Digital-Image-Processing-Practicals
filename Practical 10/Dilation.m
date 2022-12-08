b=imread("Car.jpg");
a=im2bw(b); 
subplot(1,3,1), imshow(b), title('Original Image'); 
subplot(1,3,2), imshow(a), title('Black & White Image');
[r,c]=size(a); 
w=ones(3,3);
output=[];
for x=2:1:r-1 
    for y= 2:1:c-1
    g=[w(1)*a(x-1,y-1) w(2)*a(x-1,y) w(3)*a(x-1,y+1)... 
    w(4)*a(x,y-1) w(5)*a(x,y) w(6)*a(x,y+1)... 
    w(7)*a(x+1,y-1) w(8)*a(x+1,y) w(9)*a(x+1,y+1)]; 
    output(x,y)=max(g);
    end
end

subplot(1,3,3), imshow(output), title("Dilted Image");