%% myDT function - HW1, problem 1.3
function data=myCorrelations(blobs, predictor)
% returns a matrix of: predictor value, threshold, area, radius

data=zeros(20,4);

for i=1:20
    img=blobs{i};
    thr=myThreshold(img);

    imOut=zeros(size(img));
    imOut(img>=thr)=1;
    
    area=sum(imOut(:));
    perimeter=myPerimeter(imOut);
    r=(length(unique(perimeter(:,1)))+length(unique(perimeter(:,2))))/4;
    
    data(i,:)=[predictor(i), thr, area, r];
end


end