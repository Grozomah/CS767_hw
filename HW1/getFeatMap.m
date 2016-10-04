function featMap = getFeatMap(img, m, n)

    kernel=[ones(n,m), -ones(n,m)];
    kernel2=flipud(fliplr(kernel));
    
    total=conv2(img, kernel2)/(m*n);
    
    [cx, cy]= size(kernel2);
    featMap=total(cx:end, cy:end);
    
end