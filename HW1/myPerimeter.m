function out=myPerimeter(img)
% get image perimeter - nonzero elements connected to at least one nonzero
% pixel. 
% use: out=myPerimeter(image)

se = strel('square',3);
binImg=double(img>0);   % this makes sure we properly mask nonzero elements
borderImg=binImg-imerode(binImg, se);

[x, y]=ind2sub(size(img), find(borderImg==1));
out=[x,y];

% scatter(out(:,1), out(:,2), '.')
end