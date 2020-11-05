function [PSNR,wPSNR] = wpsnr(a,b)
% ______             ______            
% | ___ \            |  _  \           
% | |_/ / __ _  ___  | | | |__ _ _   _ 
% | ___ \/ _` |/ __| | | | / _` | | | |
% | |_/ / (_| | (__  | |/ / (_| | |_| |
% \____/ \__,_|\___| |___/ \__,_|\__,_|
%                                      

% ####################### Author's information ######################
% # Name: Tran Hai Dang - Bac Dau                                   #
% # Class: AT12ET - AT120515 - Academy of Cryptography Techniques   #
% # Contact: FB - tran.h.dang.54                                    #
% #          Email - haidangtran97@gmail.com                        #
% ###################################################################

% Input: Matrices of image a and b
% Output: PSNR and WPSNR of 2 images

% Create empty matrices wPSNR
wPSNR=[];

if (a==b)
    PSNR=inf; % if 2 images are same so the result is infinitive
    wPSNR=inf;
else
    % Get matrices of color image
    if size(a,3)==3
        a=[a(:,:,1) a(:,:,2) a(:,:,3)];
        b=[b(:,:,1) b(:,:,2) b(:,:,3)];
    end
    % Calculate NVF
    NVF=nvf(a);
    NVF=NVF/max(NVF(:));
    c=NVF.*(a-b).^2;
    % Calculate PSNR and WPSNR
    c=(a-b).^2;
    PSNR=10*log10(255^2*prod(size(a))/sum(c(:)));
    c=NVF.*c;
    wPSNR=10*log10(255^2*prod(size(a))/sum(c(:)));
end
end
