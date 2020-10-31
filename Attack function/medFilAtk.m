function AttackedWatermarkedImage = medFilAtk(WatermarkedImagePath, noise)
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

% Input: Path of watermarked image
%        Noise. E.g: 3 is 3x1
% Output: Matrices of attacked image

% Doc file anh
I = imread(WatermarkedImagePath);

% Get size
[WatermarkedImageRows WatermarkedImageColumns ColorBand] = size(I);

% extract kenh mau (Extract 3 color channel)
RedChannel = I(:,:,1); % Red channel
GreenChannel = I(:,:,2); % Green channel
BlueChannel = I(:,:,3); % Blue channel

% Attack
watermarkedImage(:,:,1) = medfilt2(RedChannel, [1 noise]);
watermarkedImage(:,:,2) = medfilt2(GreenChannel, [1 noise]);
watermarkedImage(:,:,3) = medfilt2(BlueChannel, [1 noise]);

% Get the attacked channel
ImageRedChannel = watermarkedImage(:,:,1); % Red channel
ImageGreenChannel = watermarkedImage(:,:,2); % Green channel
ImageBlueChannel = watermarkedImage(:,:,3); % Blue channel

% Combine 3 channel to get color image
AttackedWatermarkedImage = cat(3, ImageRedChannel, ImageGreenChannel, ImageBlueChannel);

end

