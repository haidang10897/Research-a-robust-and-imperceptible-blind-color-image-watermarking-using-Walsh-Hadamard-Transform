function AttackedWatermarkedImage = cropCrossAtk(WatermarkedImagePath, percent)
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
%        Crop percent. E.g: 50 is crop 50% cross
% Output: Matrices of cropped image

% Doc file anh
I = imread(WatermarkedImagePath);

% Get size
[WatermarkedImageRows WatermarkedImageColumns ColorBand] = size(I);

% Get center row and column of image
RowCenterPosition = floor(WatermarkedImageRows/2);
ColumnCenterPosition = floor(WatermarkedImageColumns/2);

% Get column crop position
ColumnCropPosition = floor(((WatermarkedImageRows/100)*percent)/2);

% Calculate crop column
NegativeColumnCropPosition = abs(floor(ColumnCenterPosition-ColumnCropPosition));
if NegativeColumnCropPosition < 1
    NegativeColumnCropPosition = 1; % Prevent negative (out bound value)
end
PositiveColumnCropPosition = abs(floor(ColumnCenterPosition+ColumnCropPosition));

% Crop image verticaly
I(1:WatermarkedImageRows, NegativeColumnCropPosition:PositiveColumnCropPosition, :) = 0;

% Get row crop position
RowCropPosition = floor(((WatermarkedImageRows/100)*percent)/2);

% Calculate crop column
NegativeRowCropPosition = floor(RowCenterPosition-ColumnCropPosition);
if NegativeRowCropPosition < 1
    NegativeRowCropPosition = 1; % Prevent negative (out bound value)
end
PositiveRowCropPosition = floor(RowCenterPosition+ColumnCropPosition);

% Crop image horizontal
I(NegativeRowCropPosition:PositiveRowCropPosition, 1:WatermarkedImageColumns, :) = 0;

% Output
AttackedWatermarkedImage = I;
end

