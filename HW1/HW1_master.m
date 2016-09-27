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
if true         % switch

testImage=imread('p2\test-label.png');
imOut = myRegionFinder(testImage);
    
imshow(imOut, [0, 154])
    
    
    
end






