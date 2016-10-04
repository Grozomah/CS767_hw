%% mySegmenter function - HW1, problem 1.1
function imOut = mySegmenter(img)
% this function returns the segmented image, by calling my own Otsu
% thresholding method.
% It also prints segmented area, and radius, both in # of pixels.


thr=myThreshold(img)

imOut=zeros(size(img));
imOut(img>=thr)=1;

area=sum(imOut(:));
perimeter=myPerimeter(imOut);

r=(length(unique(perimeter(:,1)))+length(unique(perimeter(:,2))))/4;
c=length(perimeter(:,1));

disp(['Segmented area: ', num2str(area), ' pix. Radius: ', num2str(r), ...
    ' pix. Circumference: ', num2str(c), ' pix.'])
end
