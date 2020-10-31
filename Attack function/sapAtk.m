function AttackedWatermarkedImage = sapAtk(WatermarkedImagePath, noise)
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
%        Noise percent. E.g: 0.01 is 0.01%
% Output: Matrices of attacked image

% Doc file anh
I = imread(WatermarkedImagePath);

% Attack
AttackedWatermarkedImage = imnoise(I, 'salt & pepper', noise);
end

