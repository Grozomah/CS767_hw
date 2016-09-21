%% CS 767 - master file
% Peter Ferjan?i?
% 21.9.2016
% refer to this file for all proper procedures

%% Problem 1 - segmentor
if true         % switch
load('blobs.mat')

% view the data
blob3D=cat(3, blobs{:});
orthoslice(blob3D, [0, 1])

% task function
imOut = mySegmenter(blob{1})


end