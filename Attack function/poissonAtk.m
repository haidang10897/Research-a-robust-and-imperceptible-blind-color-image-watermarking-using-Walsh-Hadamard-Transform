function AttackedWatermarkedImage = poissonAtk(WatermarkedImagePath, type)
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
%        Variance
% Output: Matrices of attacked image

% Doc file anh
I = imread(WatermarkedImagePath);

% Attack
switch type
    case 'uint8'
        I = im2uint8(I);
        AttackedWatermarkedImage = imnoise(I, 'poisson');
        %AttackedWatermarkedImage = uint8(AttackedWatermarkedImage);
    case 'uint16'
        I = im2uint16(I);
        AttackedWatermarkedImage = imnoise(I, 'poisson');
       %AttackedWatermarkedImage = uint8(AttackedWatermarkedImage);
    case 'single'
        I = im2single(I);
        AttackedWatermarkedImage = imnoise(I, 'poisson');
        %AttackedWatermarkedImage = uint8(AttackedWatermarkedImage);
    case 'double'
        I = im2double(I);
        AttackedWatermarkedImage = imnoise(I, 'poisson');
        %AttackedWatermarkedImage = uint8(AttackedWatermarkedImage);
end
end

