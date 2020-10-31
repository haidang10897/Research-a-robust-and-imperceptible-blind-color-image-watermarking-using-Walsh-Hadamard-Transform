function AttackedWatermarkedImage = rotateAtk(WatermarkedImagePath, degree)
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

% Input: Path of Watermarked image
%        Degree to rotate (rotate anti-clockwise)
% Output: Matrices of attacked image

% Rotate image and rotate back (!!! MUST ROTATE BACK !!!)
% We must rotate back beacuse depend on the article that i read, when
% rotate attack an image, they rotated image and then rotated back. You can
% see in this article "Blind Color Image Watermarking Using Fan Beam
% Transform and QR Decomposition". I store this article in the "reference"
% folder so you guys can see.

% Doc file anh
I = imread(WatermarkedImagePath);

% Attack
AttackedWatermarkedImage = imrotate(I, degree, 'crop');
AttackedWatermarkedImage = imrotate(AttackedWatermarkedImage, -degree, 'crop');

end

