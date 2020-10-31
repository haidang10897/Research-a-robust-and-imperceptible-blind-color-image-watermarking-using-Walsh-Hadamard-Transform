function AttackedWatermarkedImage = resizeAtk(WatermarkedImagePath, ratio)
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
%        Resize ratio. E.g: 2 mean scale x2
% Output: Matrices of scaled image

% Doc file anh
I = imread(WatermarkedImagePath);

% Get size
[WatermarkedImageRows WatermarkedImageColumns ColorBand] = size(I);

% Attack
% We should turn off anti anliasing because it's may cause change to pixel
% data
% Nen tat khu rang cua (anti aliasing) de tranh du lieu bi tu dong thay doi
AttackedWatermarkedImage = imresize(I, ratio, 'nearest','Antialiasing',false);
AttackedWatermarkedImage = imresize(AttackedWatermarkedImage, [WatermarkedImageRows WatermarkedImageColumns], 'nearest','Antialiasing',false);

end

