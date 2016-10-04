%% myDT function - HW1, problem 1.2
function [distIn, distOut]=myDT(img)
% This function returns the inside- and outside-distance matrices for
% problem 1.2.
% input: img - black and white image
% output: distIn, distOut - matrices with Manhattan distances to the edge
% inside and outside of segmented area.

mask = mySegmenter(img);

%% part one - image inside
distIn=zeros(size(img));

inside=mask>0;
i=0;        % border is included in the mask - min dist=0
se = strel('square',3);
while (max(inside(:))>0)
    distIn(inside)=i;
    
    inside=imerode(inside, se);
    i=i+1;
end

%% part one - image outside
distOut=zeros(size(img));

outside=(mask==0);
i=1;        % border is not included in the mask - min dist=1
se = strel('square',3);
while (max(outside(:))>0)
    distOut(outside)=i;
    
    outside=imerode(outside, se);
    i=i+1;
end

end