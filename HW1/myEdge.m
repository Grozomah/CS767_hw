function edgeImg=myEdge(img);

    tabula=zeros(size(img));
    sigma=4;

    imgGauss = imgaussfilt(img, sigma);
    
    [gradMag, ~]=myEdgeDetection(img);
    
    WSimg=watershed(gradMag);
    ridgelines= WSimg==0;
    
    edgeImg=ridgelines.*gradMag;

end