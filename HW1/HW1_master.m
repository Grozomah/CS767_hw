%% CS 767 - master file
% Peter Ferjan?i?
% 21.9.2016
% refer to this file for all proper procedures

%% Problem 1 - segmentation
if true         % switch
load('p1/blobs.mat');

% view the data
orthoslice(cat(3, blobs{:}), [0, 1])

% task function
slice= 1; % 1 to 20
imOut = mySegmenter(blobs{slice});
imshow(imOut);

end