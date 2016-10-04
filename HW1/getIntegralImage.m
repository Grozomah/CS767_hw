function intimage = getIntegralImage(img);

    imsize=size(img);
    tabula=zeros(imsize);
    
    tabula(1,1)=img(1,1);
    
    %% fill the left edge
    % x and y are flipped
    for y=2:imsize(1);
        tabula(y,1)=tabula(y-1, 1)+img(y, 1);
    end
    %% fill the top edge
    % x and y are flipped
    for x=2:imsize(2);
        tabula(1,x)=tabula(1, x-1)+img(1, x);
    end
    
    %% fill everything else
    for y=2:imsize(1);
        for x=2:imsize(2);
            tabula(y,x)=tabula(y, x-1)+tabula(y-1, x)-tabula(y-1, x-1)+img(y, x);
        end
    end
    
    intimage=tabula;
end