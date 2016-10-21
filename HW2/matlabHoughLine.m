function lines = myHoughLine(img,n)

img=imread('p2/2.1/2.png');
image(img)

% get gradient image
[gimg, ~]=myEdgeDetection(img); % this will make sharper edges
image(gimg)

% get Hough transform
temp=hough(gimg);
imshow(temp, [min(temp(:)), max(temp(:))])
axis on, axis normal
colormap(hot);

lines=1;
end