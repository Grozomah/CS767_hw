function tabula=myEdge(img, start)

% !! x and y are inverted in matrix form !!
x=start(1);
y=start(2);

if img(y,x)==0
    error('Please select pix with nonzero edge mask value')
    return
end

% tabula is the tool we expect to draw our result on
tabula=zeros(size(img));

% sigma=5;
% imgGauss = imgaussfilt(img, sigma);
% WSimg=watershed(imgGauss);
% ridgelines= WSimg==0;
% imshow(ridgelines)


edges=myRegionFinder8N(img > 0);
% imshow(edges, [0, max(edges(:))*0.75])

tabula=(edges==edges(y,x));

end