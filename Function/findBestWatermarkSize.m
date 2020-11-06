function [WatermarkH,WatermarkW] = findBestWatermarkSize(HostImagePath)
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

% Input: Host image path
% Output: Best watermark size

% Read image
HostImage = imread(HostImagePath);

% Get size
[HostImageR, HostImageC, HostImageChannel] = size(HostImage);

% Calculate
HostImageBlock = (HostImageR*HostImageC)/16;
MaxBit = HostImageBlock * 4;
MaxPixels = MaxBit / 8;
PixelsLength = floor(sqrt(MaxPixels));

% Output
WatermarkH = PixelsLength;
WatermarkW = PixelsLength;

end

