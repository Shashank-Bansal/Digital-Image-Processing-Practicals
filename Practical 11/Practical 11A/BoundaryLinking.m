img = imread('Flower.jpg');
img = rgb2gray(img);
% Smoothing
h = fspecial('average', 9);
g = imfilter(img, h, 'replicate');
% Threhsolding
bw = im2bw(g, 0.5);
% Longest boundary
B = bwboundaries(bw);
d = cellfun('length', B);
[max_d, k] = max(d);
b = B{k};
% Boundary image
[M, N] = size(g);
B2 = bound2im(b, M, N, min(b(:, 1)), min(b(:,2)));
% Subsampling
[s, su] = bsubsamp(b, 50);
g2 = bound2im(s, M, N, min(s(:, 1)), min(s(:,2)));
% Connected Sequence
cn = connectpoly(s(:,1), s(:,2));
g3 = bound2im(cn, M, N, min(cn(:, 1)), min(cn(:,2)));
fprintf('\n');
subplot(2,3,1), imshow(img), title('Original Image');
subplot(2,3,2), imshow(g), title('Image Smoothening');
subplot(2,3,3), imshow(bw), title('Thresholding');
subplot(2,3,4), imshow(B2), title('Boundary');
subplot(2,3,5), imshow(g2), title('Subsampling');
subplot(2,3,6), imshow(g3), title('Connected Sequence');
sgtitle('Boundary Linking')
function B = bound2im(b, M, N, x0, y0)
[np, nc] = size(b);
if np < nc
    b = b';
    [np,nc] = size(b);
end
x = round(b(:,1));
y = round(b(:,2));
x = x - min(x) + 1;
y = y - min(y) + 1;
B = false(max(x), max(y));
C = max(x) - min(y) + 1;
D = max(y) - min(y) + 1;
if nargin == 1
elseif nargin == 3
    if C > M || D > N
        error('The boundary is outside the M by N region');
    end
    B = false(M,N);
    NR = round((M-C)/2);
    NC = round((N-D)/2);
    x = x + NR;
    y = y + NC;
elseif nargin == 5
    if x0 < 0 || y0 < 0
        error('x0 and y0 must be positive integers');
    end
    x = x+ round(x0) - 1;
    y = y + round(y0) - 1;
    C = C+ x0 -1;
    D = D + y0 -1;
    if C > M || D > N
        error('The shifted boundary is outside the M by N region');
    end
    B = false(M,N);
else
    error('Incorrect number of inputs');
end
B(sub2ind(size(B), x, y)) = true;
end
function [s, su] = bsubsamp(b, gridsep)
% Check input.
[np, nc] = size(b);
if np < nc 
   error('B must be of size np-by-2.'); 
end
if gridsep/2 ~= round(gridsep/2) 
   error('GRIDSEP must be an even integer.')
end

if isequal(b(1, :), b(np, :))
   np = np - 1;
   b = b(1:np, :);
end
xmax = max(b(:, 1));
ymax = max(b(:, 2));
GLx = ceil((xmax + gridsep)/(gridsep + 1));
GLy = ceil((ymax + gridsep)/(gridsep + 1));
I = 1:GLx;
X(I) = gridsep*I + (I - gridsep); 
J = 1:GLy;
Y(J) = gridsep*J + (J - gridsep); 
DIST = gridsep/2;
[YG, XG] = meshgrid(Y, X);
Q = 1;
for k=1:np
   [I,J] = find(abs(XG - b(k, 1)) <= DIST & abs(YG - b(k, 2)) <= ...
                DIST); 
   I = I(1);
   J = J(1);
   ord = k; % To keep track of order of input coordinates.
   d1(Q, :) = cat(2, Y(J), ord);
   d2(Q, :) = cat(2, X(I), ord);
   Q = Q + 1;
end
d = cat(2, d2(:, 1), d1); % The second column of d1 & d2 is ord.
d = fliplr(d); % So the last column becomes first.
d = sortrows(d);
d = fliplr(d); % Flip back.
s = d(:, 1:2);
[s, m, ~] = unique(s, 'rows');
s = [s, m];
s = fliplr(s);
s = sortrows(s);
s = fliplr(s);
s = s(:, 1:2);
su = round(s./gridsep) + 1;
end
function c=connectpoly(x,y)
v = [x(:), y(:)];

if ~isequal(v(end, :), v(1, :))
    v(end+1, :) = v(1, :);
end
segments = cell(1, length(v) - 1);
for I = 2:length(v)
    [x,y] = intline(v(I-1,1), v(I,1), v(I-1,2), v(I,2));
    segments{I-1} = [x,y];
end
c = cat(1, segments{:});
end
function [x, y] = intline(x1, x2, y1, y2)
dx = abs(x2-x1);
dy = abs(y2-y1);
if((dx==0) && (dy==0))
    x = x1;
    y = y1;
    return;
end
flip = 0;
if(dx >=dy)
    if(x1 > x2)
        t = x1; x1 = x2; x2 = t;
        t = y1; y1 = y2; y2 = t;
        flip = 1;
    end
    m = (y2-y1)/(x2-x1);
    x = (x1:x2).';
    y = round(y1 + m*(x-x1));
else
    if(y1 > y2)
        t = x1; x1 = x2; x2 = t;
        t = y1; y1 = y2; y2 = t;
        flip = 1;
    end
    m = (x2-x1)/(y2-y1);
    y = (y1:y2).';
    x = round(x1 + m*(y - y1));
end

if(flip)
    x = flipud(x);
    y = flipud(y);
end
end
function  c = fchcode(b, conn, dir) 
% Preliminaries. 
if nargin == 1  
   dir = 'same';  
   conn = 8; 
elseif nargin == 2  
   dir = 'same'; 
elseif nargin == 3    
   % Nothing to do here. 
else  
   error('Incorrect number of inputs.') 
end 
[np, nc] = size(b); 
if np < nc  
   error('B must be of size np-by-2.');  
end 
if isequal(b(1, :), b(np, :)) 
   np = np - 1; 
   b = b(1:np, :); 
end 
C(11)=0; C(7)=1; C(6)=2; C(5)=3; C(9)=4; 
C(13)=5; C(14)=6; C(15)=7; 
x0 = b(1, 1); 
y0 = b(1, 2); 
c.x0y0 = [x0, y0]; 
a = circshift(b, [-1, 0]); 
DEL = a - b; 
if any(abs(DEL(:, 1)) > 1) || any(abs(DEL(:, 2)) > 1) 
   error('The input curve is broken or points are out of order.') 
end  
z = 4*(DEL(:, 1) + 2) + (DEL(:, 2) + 2); 
fcc = C(z); 
if strcmp(dir, 'reverse') 
   fcc = coderev(fcc); 
end  
if conn == 4 
   val = find(fcc == 1 | fcc == 3 | fcc == 5 | fcc ==7, 1 ); 
   if isempty(val) 
      fcc = fcc./2; 
   else 
      warning('The specified 4-connected code cannot be satisfied.') 
   end 
end 
c.fcc = fcc; 
c.diff = codediff(fcc,conn); 
c.mm = minmag(fcc); 
c.diffmm = codediff(c.mm, conn); 
end
function cr = coderev(fcc) 
cr = fliplr(fcc); 
ind1 = find(0 <= cr & cr <= 3); 
ind2 = find(4 <= cr & cr <= 7); 
cr(ind1) = cr(ind1) + 4; 
cr(ind2) = cr(ind2) - 4; 
end 
function z = minmag(c) 
I = find(c == min(c)); 
% and shift each one left so that it starts with min(c). 
J = 0; 
A = zeros(length(I), length(c)); 
for k = I 
   J = J + 1; 
   A(J, :) = circshift(c,[0 -(k-1)]); 
end 
[M, N] = size(A); 
J = (1:M)'; 
for k = 2:N 
   D(1:M, 1) = Inf; 
   D(J, 1) = A(J, k); 
   amin = min(A(J, k)); 
   J = find(D(:, 1) == amin); 
   if length(J)==1 
      z = A(J, :); 
      return 
   end 
end 
end    
function d = codediff(fcc, conn) 
sr = circshift(fcc, [0, -1]); % Shift input left by 1 location. 
delta = sr - fcc; 
d = delta; 
I = find(delta < 0); 
type = conn; 
switch type 
case 4 % Code is 4-connected 
   d(I) = d(I) + 4; 
case 8 % Code is 8-connected 
   d(I) = d(I) + 8; 
end 
end