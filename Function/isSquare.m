function Logic = isSquare(WatermarkImagePath)
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

% Input: Host Image path
%        Watermark Image path
% Output: Get channels of image

% Read images
WatermarkImage = imread(WatermarkImagePath);

% Get size of Watermark Image and Host Image
[WatermarkImageR, WatermarkImageC, WatermarkImageChannel] = size(WatermarkImage);

% Output
if WatermarkImageR == WatermarkImageC
    Logic = true;
else
    Logic = false;
end

end

