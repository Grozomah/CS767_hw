
function imOut=mySnek(img, start)

%                           ____
%  ________________________/ O  \___/
% <_____________________________/   \


sigma=5;
imgGauss = imgaussfilt(img, sigma);
[gradMag, ~]=myEdgeDetection(imgGauss);
gradMag(:, end)=0;
gradMag(end, :)=0;

imshow(gradMag, [0, max(median(gradMag))])

%% get starting approximation
start=[246,155];
gval=gradMag(start(2), start(1));
regions=myRegionFinder8N(gradMag > gval*0.8);
imshow(regions, [0, max(regions(:))]);
edge = regions==regions(start(2), start(1));

mask=bwconvhull(edge);
imshow(mask)

% Now find the improved outer boundary using active contours.
bw = activecontour(img*10, mask, 100, 'edge');
se = strel('square',3);
edge=bw-imerode(bw, se);

imshow(img)


imOut=edge;
end
