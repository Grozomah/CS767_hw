
function thr=myThreshold(img)
%% calculate roughly Otsu's threshold
Nbin=100+1;            % number of bins/precision
thr=inf;

Npix=length(img(:));   % total number of pixels
[N, edges]=histcounts(img, min(img(:)):1/(Nbin-1):max(img(:)));

Nout=N(1);             % number of pixels outside (mask 0)
ICvariance=-inf;
for i=2:Nbin-1
    Nout=Nout+N(i);
    Nin=Npix-Nout;  % number of pixels inside (mask 1)
    
    % we want to maximize inter-class variance: 
    % sum(p0...pt-1) * sum(pt...pN) * (mean1-mean2)^2
    
    listOut=img(img<edges(i));
    listIn=img(img>=edges(i));
    
    muIn=mean(listIn);
    muOut=mean(listOut);
    
    ICvarianceTemp=Nout*Nin*(muIn-muOut)*(muIn-muOut);
    % source for the math: wikipedia. Disclamer: there is also a matlab
    % code on the website. I tried to write mine without looking at the
    % provided example.
    
%     disp([i, ICvarianceTemp])
    if ICvarianceTemp>ICvariance
        ICvariance=ICvarianceTemp;
        thr=edges(i);
%         disp(['i: ', num2str(i), ', thr: ', num2str(thr), ', var: ', num2str(ICvariance)])
    end
end

end