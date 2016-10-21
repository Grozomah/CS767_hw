function [gradMag, gradDir]=myEdgeDetection(image)

kernely=...
    [1 2 1
    -1 -2 -1];
kernelx=...
    [-1 1
    -2 2
    -1 1];

grady =conv2(double(image),kernely,'same');
% imshow(grady, [-1,1])
gradx =conv2(double(image),kernelx,'same');
% imshow(gradx, [-1,1])

gradMag= sqrt(gradx.^2+grady.^2);
gradDir = atan(grady./gradx) + (1- gradx./abs(gradx))/2 *pi;

end