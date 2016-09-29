function myQuiver(gradDir, downsize)
% Use: myQuiver(gradDir, downsize)
% gradDir - gradient direction image [matrix form]
% downsize - by what factor to resample the image [scalar, e.g.: 5]

gradx=imresize(cos(gradDir), 1/downsize);
grady=imresize(sin(gradDir), 1/downsize);

figure
[tabulaX, tabulaY] = meshgrid(1:size(gradx,2), size(gradx,1):-1:1);
quiver(tabulaX, tabulaY, gradx, grady)

end