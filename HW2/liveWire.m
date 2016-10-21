function imOut = liveWire(imIn, seedRow, seedCol)
    
%     idx=[3,8];
%     load('testMatrix.mat')
%     imIn=testMatrix;
%     seedRow=idx(2);
%     seedCol=idx(1);
    
    Msize=size(imIn);

    %% stating definitions
    L= []; % list of starting pixels
    neighb = make8NeighborList(imIn); % Neighborhood list 
    e=zeros(size(imIn)); % matrix which pixels have been processed
    g=inf*ones(size(imIn)); % total cost to certain pixel
    p=zeros(size(imIn));    % pointers from minimum path cost
    
    %% initialize
    L=sub2ind(Msize, seedRow, seedCol);
    g(seedRow, seedCol)=0;
    
    %% loopey
    while length(L)>0
        
        if(sum(g(L)==inf)>0)
            disp('error!')
        end

        [M, I]=min(g(L)); % find minimum element in active list
        currentElementIdx=L(I);
%         disp(I)
        L(I) =[];   % remove minimum element
        e(currentElementIdx)=1;
        
        % now for each neighbour
        currentNeighbours=neighb{currentElementIdx};
        for ii=1:length(currentNeighbours)
            neigIdx=currentNeighbours(ii);
            if e(neigIdx)==1;
                % skip if neighbor already done
                continue
            end
            
            
            % COST TO NEIGHBOUR CALCULATED HERE!!
            if abs(neigIdx-currentElementIdx)==1
                cost=imIn(neigIdx);
            elseif abs(neigIdx-currentElementIdx)==Msize(1)
                cost=imIn(neigIdx);
            else
                cost=round(1.41*imIn(neigIdx));
            end 
            gidxnew=g(currentElementIdx)+cost;
            
            % if neighbor on list:
            if g(neigIdx)<inf
                if gidxnew<g(neigIdx)
                    g(neigIdx)= gidxnew;
                    % add pointer from min path
                    p(neigIdx)=currentElementIdx;
                end
                
            else % otherwise calculate new cost to pix
                gidxnew=g(currentElementIdx)+cost;
                g(neigIdx)=gidxnew;
                % add pointer from min path
                p(neigIdx)=currentElementIdx;
                
                % add neighbours to work list
                L=unique([L; neigIdx]);
            end
        end    
    end
    
    imOut=g;
end