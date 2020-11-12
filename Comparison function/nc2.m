function ncResult = nc2(watermarkedImage,hostImage)
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

% Input: Watermarked image matrices
%        Host Image path
% Output: NC of 2 images
% Note: Function nc and nc2 is the same, the only different is input

% Doc file anh
hostImage = imread(hostImage);

if all(watermarkedImage == watermarkedImage(1,1,1))
    ncResult = 'N/A';
else
% Trich xuat kenh mau.
% Trich xuat R, G, B cua anh da thuy van
watermarkedImageRedChannel = watermarkedImage(:,:,1); % Red channel
watermarkedImageGreenChannel = watermarkedImage(:,:,2); % Green channel
watermarkedImageBlueChannel = watermarkedImage(:,:,3); % Blue channel

% Trich xuat R, G, B cua anh goc
hostImageRedChannel = hostImage(:,:,1); % Red channel
hostImageGreenChannel = hostImage(:,:,2); % Green channel
hostImageBlueChannel = hostImage(:,:,3); % Blue channel

%Tinh toan NC cua tung kenh mau
ncRedChannel = max(max(normxcorr2(watermarkedImageRedChannel(:,:),hostImageRedChannel(:,:))));
ncGreenChannel = max(max(normxcorr2(watermarkedImageGreenChannel(:,:),hostImageGreenChannel(:,:))));
ncBlueChannel = max(max(normxcorr2(watermarkedImageBlueChannel(:,:),hostImageBlueChannel(:,:))));

% Ket qua NC = AVG NC cua 3 kenh mau
ncResult = (ncRedChannel + ncGreenChannel + ncBlueChannel)/3;
end
end