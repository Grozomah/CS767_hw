%% CS 767 - master file
% Peter Ferjan?i?
% 21.9.2016
% refer to this file for all proper procedures

cd('E:\005-faks\CS767\HW\HW1')
%% ############################################ %%
%% Problem 1 - segmentation
if false         % switch
    load('p1/blobs.mat');
    slice= 1; % 1 to 20
    % view the data
%     orthoslice(cat(3, blobs{:}), [0, 1])

    % problem 1.1
    imOut = mySegmenter(blobs{slice});
%     imshow(imOut);
    
    % problem 1.2
    [out1, out2] = myDT(blobs{slice});
%     imshow(out1, [0, 80]);
%     imshow(out2, [0, 100]);
    
    % problem 1.3
    data=myCorrelations(blobs, predictor);
    % correlation between predictor and area
    R1 = corrcoef(data(:,1),data(:,3))
    % correlation between predictor and radius
    R2 = corrcoef(data(:,1),data(:,4))
end


%% ############################################ %%
%% Problem 2 - region labeling
if false         % switch
    img2=imread('p2\test-label.png');
    imOut = myRegionFinder(img2);
    imshow(imOut, [0, 5])
end


%% ############################################ %%
%% Problem 3 - edge detection
if false         % switch
    img3=im2double(imread('p3\edge_link.png'));
    % smooth data
    sigma=3;
    img3a = imgaussfilt(img3, sigma);
    % imshow(img3a)

    % problem 3.1
    [gradMag, gradDir]=myEdgeDetection(img3);
    imshow(gradMag)
    myQuiver(gradDir, 1)

    % problem 3.2
    start=[229,206];
    edgeOut=myEdgeExtraction(gradMag, start);
    imshow(edgeOut)
end


%% ############################################ %%
%% Problem 4 - medical image analysis
if true         % switch
    img4rgb=imread('p4\dsa.png');
    img4=double(rgb2gray(img4rgb));
    i=10;
    j=10;
    m=3;
    n=6;
    feature = getFeature(img4, i, j, m, n);
    
    featMap = getFeatMap(img4,m,n);
    imshow(featMap, [min(featMap(:))*0.8,max(featMap(:))*0.8]);
end



