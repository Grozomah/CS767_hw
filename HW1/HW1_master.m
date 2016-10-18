%% CS 767 - master file
% Peter Ferjan?i?
% 21.9.2016
% refer to this file for all proper procedures

cd('E:\005-faks\CS767\HW\HW1')
%% ############################################ %%
%% Problem 1 - segmentation
if false         % switch
    load('p1/blobs.mat');
    sliceN= 7; % 1 to 20
    % view the data
%     orthoslice(cat(3, blobs{:}), [0, 1])

    %% problem 1.1
    imOut = mySegmenter(blobs{sliceN});
    imshow(blobs{sliceN});
    hold on
    contour(imOut, 'r')
    hold off
    
    %% problem 1.2
    [out1, out2] = myDT(blobs{sliceN});
    imshow(out1, [0, 80]);
    imshow(out2, [0, 100]);
    
    %% problem 1.3
    data=myCorrelations(blobs, predictor);
    
    % correlation between predictor and area
    R1 = corrcoef(data(:,1),data(:,3))
    scatter(data(:,1),data(:,3))
    title('predictor vs area')
    xlabel('predictor')
    ylabel('area')
    
    % correlation between predictor and radius
    R2 = corrcoef(data(:,1),data(:,4))
    scatter(data(:,1),data(:,4))
    title('predictor vs radius')
    xlabel('predictor')
    ylabel('radius')
end


%% ############################################ %%
%% Problem 2 - region labeling
if false         % switch
    img2=imread('p2\test-label.png');
    
    imOut = myRegionFinder(img2);
    imshow(imOut, [0, max(imOut(:))])
    
    % 8-neighborhood
    imOut = myRegionFinder8N(img2);
    imshow(imOut, [0, max(imOut(:))])
    
    % make pretty pretty colors 
    Irgb = label2rgb(imOut, 'jet', 'w', 'shuffle');
    imshow(Irgb)
end


%% ############################################ %%
%% Problem 3 - edge detection
if false         % switch
    img3=im2double(imread('p3\edge_link.png'));
    % smooth data
    sigma=3;
    img3a = imgaussfilt(img3, sigma);
    % imshow(img3a)

    %% problem 3.1
    [gradMag, gradDir]=myEdgeDetection(img3);
    imshow(gradMag)
    myQuiver(gradDir, 2)

    %% problem 3.2
%     img3=im2double(imread('p3\edge_detector.png'));
%     img3=im2double(rgb2gray(imread('p3\img_ct_lung.jpg')));
    img3=im2double(imread('p3\edge_link.png'));
    
    imshow(img3, [min(img3(:)), max(img3(:))])
    
    %% 3.2.1 straightforward way of doing it
    edgeImg=edge(img3);
    imshow(edgeImg)
    
    start=[164,128];
    edgeOut=myEdgeExtraction(edgeImg, start);
    imshow(edgeOut)
    
    %% 3.2.2 another attempt at it
    % not really working
%     edgeImg=myEdge(img3);
%     imshow(edgeImg)
    
    %% 3.2.3 snake attempt
    imOut=mySnek(img3, start);
    imshow(imOut)
    
    %% 3.2.4 snake attempt 2, with input
    imOut=mySnekInput(img);
    
end


%% ############################################ %%
%% Problem 4 - medical image analysis
if false         % switch
    img4rgb=imread('p4\dsa.png');
    img4=double(rgb2gray(img4rgb));
    i=10;
    j=10;
    m=3;
    n=6;
    
%     imshow(img4, [min(img4(:))*0.8,max(img4(:))*0.8]);
    
    %% 4.1 get integral image
    intimage = getIntegralImage(img4);
    imshow(intimage, [min(intimage(:))*0.8,max(intimage(:))*0.8]);
    
    %% 4.2 get single feature
    feature = getFeatureCrude(img4, i, j, m, n);
    
    feature = getFeature(img4, i, j, m, n);
    
    
    %% 4.3 get feature map
    featMap = getFeatMap(img4,m,n);
    imshow(featMap, [min(featMap(:))*0.8,max(featMap(:))*0.8]);
    
    
    numBins=50;
    featureHist = getFeatureHist(img4, m, n, numBins);
    
    
end



