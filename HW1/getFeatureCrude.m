function feature = getFeatureCrude(img, i, j, m, n)
    
    x1=i;
    x2=i+m-1;
    x3=i+2*m-1;
    y1=j;
    y2=j+n-1;    

    if m<1 || n<1 
%         disp('Illegal parameters')
        feature=0;
        return
    end
    if i<1 || i>size(img, 2)-2*m || j<1 || j>size(img,1)-n
%         disp('Illegal coordinates')
        feature=0;
        return
    end

    % evaluate imIn at (i,j)
    % m is width of each section (total width 2m)
    % n is height of the rectangle
    
    a1= img(y1:y2, x1:x2);
    a2= img(y1:y2, x2+1:x3);
    
    feature= mean(a1(:))-mean(a2(:));
end