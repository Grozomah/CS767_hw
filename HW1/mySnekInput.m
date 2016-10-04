
function imOut=mySnekInput(img)


close all

%                            ____
%   ________________________/ O  \___/
%  <%%%%%%%%%%%%%%%%%%%%%%%%_____/   \

sigma=5;
imgGauss = imgaussfilt(img, sigma);
[gradMag, ~]=myEdgeDetection(imgGauss);
gradMag(:, end)=0;
gradMag(end, :)=0;

imshow(gradMag)

h = [] ;
%     h = imfreehand(gca);
h = imfreehand();
canvas=zeros(size(img));
mask = createMask(h);
delete(h)

imshow(mask)

% Now find the improved outer boundary using active contours.
bw = activecontour(img*10, mask, 400, 'edge', 'SmoothFactor',0.5);
% imshow(bw)

imshow(img)
hold on
GrayIndex = uint8(floor(bw * 255));
    Map       = jet(255);
    RGB       = ind2rgb(GrayIndex, Map);

    % overlap PET, then apply alpha blending
    h = imshow(RGB);
    % set colormap transparency
    set(h, 'AlphaData', bw);
hold off

imOut=bw;
end
