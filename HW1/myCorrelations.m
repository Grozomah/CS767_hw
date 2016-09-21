function data=myCorrelations(blobs, predictor)

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