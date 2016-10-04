function featureHist = getFeatureHist(img, m, n, numBins);

    featMap = getFeatMap(img, m, n);

    [N, edges]=histcounts(featMap, numBins);
    
    
    histogram(featMap, numBins)
    title(['Feature histogram, m=', num2str(m), ', n=', num2str(n)])
    
    featureHist=[N];
end