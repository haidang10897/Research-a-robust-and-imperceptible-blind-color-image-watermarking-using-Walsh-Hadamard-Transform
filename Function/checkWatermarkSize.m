function [output] = checkWatermarkSize(HostImagePath, WatermarkImagePath)
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

% INPUT: duong dan anh cua HostImage va WatermarkImage
% OUTPUT: true, false de check xem dung luong nhung cua WatermarkImage co
% phu hop khong.

% Input: Host Image's path
%        Watermark Image's path
% Output: Check if watermark image can embed into host image?

% doc ma tran anh (Read 2 images)
HostImage = imread(HostImagePath);
WatermarkImage = imread(WatermarkImagePath);

% Lay ma tran cua 1 kenh mau bat ky (Get matrix of 1 channel)
WatermarkImageRedChannel = WatermarkImage(:,:,1); % Red channel Watermark Image
HostImageRedChannel = HostImage(:,:,1); % Red channel Host Image

% Lay size cua HostImage va WatermarkImage (Get size of channel)
HostImageR = size(HostImageRedChannel, 1); % Lay size cua row
HostImageC = size(HostImageRedChannel, 2); % Lay size cua column

WatermarkImageR = size(WatermarkImageRedChannel, 1); % Lay size cua row
WatermarkImageC = size(WatermarkImageRedChannel, 2); % Lay size cua column

% Tinh so block cua HostImage va WatermarkImage (Check)
HostImageBlock = (HostImageR*HostImageC)/16;
WatermarkImageBlock = (WatermarkImageR*WatermarkImageC*8)/4;

% Output
if (WatermarkImageBlock <= HostImageBlock)
    output = true;
else
    output = false;
end

end

