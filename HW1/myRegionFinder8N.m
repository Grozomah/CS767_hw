function out=myRegionFinder8N(img)
% finds all 4- connected regions

bin=img>0;
out     =zeros(size(img));
canvas  =zeros(size(img));
matsize=size(canvas);
imax=matsize(1)*matsize(2);

%% step 1: where we find neighborhoods
for i=1:imax %each pix in matrix
    if bin(i)==1% bin value is 1
        
        if rem(i,matsize(1))~= 1 % pix is not top row
            % get top value, if available
            if(canvas(i-1)>0)
                canvas(i)=canvas(i-1);
                continue
            end
        end
        
        if i>matsize(1) % pix is not left edge
            % get left value, if available
            if(canvas(i-matsize(1))>0)
                canvas(i)=canvas(i-matsize(1));
                continue
            end
            % upper left
            if(canvas(i-matsize(1)-1)>0) && rem(i,matsize(1))~= 1
                canvas(i)=canvas(i-matsize(1)-1);
                continue
            end
            % lower left
            if(canvas(i-matsize(1)+1)>0) && rem(i,matsize(1))~= 0
                canvas(i)=canvas(i-matsize(1)+1);
                continue
            end
        end
        
        canvas(i)=max(canvas(:)+1); % otherwise, assign new value
    end
end

%% part 2: where we connect the neighborhoods
for i=1:imax %each pix in matrix
    if canvas(i)>0% bin value is 1
        % we only need to take care of left-right connection. Methinks.
        
        if i>matsize(1) % pix is not left edge
            % get left value, if available
            if(canvas(i-matsize(1))>0)
                % and if they not the same
                if (canvas(i-matsize(1))~=canvas(i))
                    % replace all old labels with smaller neighbor
                    canvas(canvas==canvas(i))=canvas(i-matsize(1));
                end
            end
            
            if(canvas(i-matsize(1)-1)>0)
                % and if they not the same
                if (canvas(i-matsize(1)-1)~=canvas(i))
                    % replace all old labels with smaller neighbor
                    canvas(canvas==canvas(i))=canvas(i-matsize(1)-1);
                end
            end
            
            if(canvas(i-matsize(1)+1)>0)
                % and if they not the same
                if (canvas(i-matsize(1)+1)~=canvas(i))
                    % replace all old labels with smaller neighbor
                    canvas(canvas==canvas(i))=canvas(i-matsize(1)+1);
                end
            end
            
        end
    end
end
%% part 3: where we replace the labels to be pretty
replaceLabels=unique(canvas); % these are the values that need replacing
replaceLabels=replaceLabels(replaceLabels>0);

for i=1:length(replaceLabels);
    out(canvas==replaceLabels(i))=i;
end

% out=bwlabel(img);
end