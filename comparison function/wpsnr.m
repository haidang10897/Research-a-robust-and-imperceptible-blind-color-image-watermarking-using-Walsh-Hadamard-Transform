function [PSNR,wPSNR] = wpsnr(a,b)
wPSNR=[];
if (a==b)
    out=inf;
else
    if size(a,3)==3
        a=[a(:,:,1) a(:,:,2) a(:,:,3)]; 
        b=[b(:,:,1) b(:,:,2) b(:,:,3)];
    end    
        NVF=nvf(a);
        NVF=NVF/max(NVF(:));
        c=NVF.*(a-b).^2;
   
    c=(a-b).^2;
    PSNR=10*log10(255^2*prod(size(a))/sum(c(:)));
    c=NVF.*c;
    wPSNR=10*log10(255^2*prod(size(a))/sum(c(:)));        
end   
end
