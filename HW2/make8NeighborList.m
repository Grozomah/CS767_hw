function neigh = make8NeighborList(imIn);
% function that creates neighbor list for image

matsize=size(imIn);
Nmax=matsize(2)*matsize(1);

neigh=cell(Nmax, 1);

indeces=zeros(matsize(1)+2, matsize(2)+2);
indeces(2:end-1, 2:end-1)=reshape(1:Nmax, size(imIn));

for i=1:Nmax
    Irow=rem(i-1,matsize(1))+2; % current row in indeces
    Icol=fix((i-1)/matsize(1))+2; % current col in indeces
    
    temp=indeces(Irow-1:Irow+1, Icol-1:Icol+1);
    temp(2, 2)=0;
    temp=temp(temp>0);
    
    neigh{i}=temp;
end
disp('Neighbours found')
end