function feature = getFeature(img, i, j, m, n)
    
    x1=i;
    x2=i+m-1;
    x3=i+2*m-1;
    y1=j;
    y2=j+n-1;    

    if m<1 || n<1 
        disp('Illegal parameters')
        feature=0;
        return
    end
    if i<1 || i>size(img, 2)-2*m || j<1 || j>size(img,1)-n
        disp('Illegal coordinates')
        feature=0;
        return
    end
    
    intImg=getIntegralImage(img);
    
    feat1=intImg(j-1,i-1) + intImg(j+n-1, i+m-1) - intImg(j-1, i+m-1) - intImg(j+n-1,i-1);
            
    feat2=intImg(j-1, i+m-1) + intImg(j+n-1, i+2*m-1) - intImg(j+n-1, i+m-1)- intImg(j-1, i+2*m-1);
    feature = (feat1-feat2)/(m*n);
end