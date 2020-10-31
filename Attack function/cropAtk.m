function AttackedWatermarkedImage = cropAtk(WatermarkedImagePath, percent)
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

% Crop image verticaly
% Note: Another way is use imcrop() function, and then reconstruct image
% But in this function, i crop image by setting all the crop area to 0. 
% I think this way is easier.

% Input: Path of watermarked image
%        Crop percent. E.g: 50 is crop 50% verticaly
% Output: Matrices of cropped image

% Doc file anh
I = imread(WatermarkedImagePath);

% Get size
[WatermarkedImageRows WatermarkedImageColumns ColorBand] = size(I);

% Get crop position
RowCropPosition = floor((WatermarkedImageRows/100)*percent);

% Crop image verticaly
I(1:RowCropPosition, 1:512, :) = 0;

% Output
AttackedWatermarkedImage = I;
end

