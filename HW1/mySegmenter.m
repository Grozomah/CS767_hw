%% mySegmenter function - HW1, problem 1.1

function imOut = mySegmenter(img)

thr=myThreshold(img)

imOut=zeros(size(img));
imOut(img>=thr)=1;

area=sum(imOut(:));
perimeter=myPerimeter(imOut);

r=(length(unique(perimeter(:,1)))+length(unique(perimeter(:,2))))/4;

disp(['Segmented area: ', num2str(area), ' pix. Radius: ', num2str(r), ' pix.'])
end
