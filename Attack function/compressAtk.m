function AttackedWatermarkedImage = compressAtk(WatermarkedImagePath, OutputFileName, mode, ratio)
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

% Input: Path of watermark image
%        Name of output image
%        Mode: Can be 'lossless' or 'lossy'
%        Ratio: Compress ratio. E.g: 2 is ratio 2:1
% Output: Matrices of attacked image that have been compress
%         Compressed image that saved in 'CompressImage' folder;

% Doc file anh
I = imread(WatermarkedImagePath);

% Attack
mkdir CompressImage;
dir = fullfile(pwd, 'CompressImage');
if strcmp(mode, 'lossless') == 1
    imwrite(I, fullfile(dir, OutputFileName),'jp2', 'Mode','lossless');
elseif strcmp(mode,'lossy') == 1
    imwrite(I,fullfile(dir, OutputFileName),'jp2', 'CompressionRatio', ratio);
end
AttackedWatermarkedImage = imread(fullfile(dir, OutputFileName));
end

