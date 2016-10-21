% function lines = myHoughLine(img,n)

%% intro
img=imread('p2/2.1/2.png');
image(img)
% get gradient image
[gimg, ~]=myEdgeDetection(img); % this will make sharper edges
image(gimg)

Dtheta=pi/180;

 %% calculations
%Define the hough space
gimg = flipud(gimg);
Msize = size(gimg);

maxRho = sqrt(Msize(1)^2+Msize(2)^2); % diagonal distance
rho = [-maxRho:1:maxRho];

thetaLst = [0:Dtheta:pi];
nThetas = numel(thetaLst);

houghSpace = zeros(numel(rho),nThetas);

% get index lists, ignore zero elements
[xIndicies,yIndicies] = find(gimg); 

%Preallocate space for the accumulator array
numEdgePixels = numel(xIndicies);
% get space to place calculated curve y values in
accumulator = zeros(numEdgePixels,nThetas); 

%Preallocate cosine and sine calculations to increase speed. In
%addition to precallculating sine and cosine we are also multiplying
%them by the proper pixel weights such that the rows will be indexed by 
%the pixel number and the columns will be indexed by the thetas.
%Example: cosine(3,:) is 2*cosine(0 to pi)
%         cosine(:,1) is (0 to width of image)*cosine(0)
cosine = (0:Msize(2)-1)'*cos(thetaLst); %Matrix Outerproduct  
sine = (0:Msize(2)-1)'*sin(thetaLst); %Matrix Outerproduct

accumulator((1:numEdgePixels),:) = cosine(xIndicies,:) + sine(yIndicies,:);

%Scan over the thetas and bin the rhos 
for i = (1:nThetas)
    houghSpace(:,i) = hist(accumulator(:,i),rho);
end


houghSmooth = imgaussfilt(houghSpace,1);

pcolor(thetaLst,rho,houghSmooth);
shading flat;
title('Hough Transform');
xlabel('Theta (radians)');
ylabel('Rho (pixels)');
colormap(hot);



% end