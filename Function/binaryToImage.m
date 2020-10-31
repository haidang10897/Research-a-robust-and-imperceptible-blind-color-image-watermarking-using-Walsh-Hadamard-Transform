function [scrambledImage] = binaryToImage(binaryRedChannelWatermarkImage, binaryGreenChannelWatermarkImage, binaryBlueChannelWatermarkImage, watermarkImageRows, watermarkImageColumns)
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

% Input: Red channel of Image in binary
%        Green channel of Image in binary
%        Blue channel of Image in binary
% Output: Reshaped matrices of Image

% chuyen vecto cot sang matrix (Change vector to matrix)
binaryRedChannelWatermarkImage = reshape(binaryRedChannelWatermarkImage,[],8);
binaryGreenChannelWatermarkImage = reshape(binaryGreenChannelWatermarkImage,[],8);
binaryBlueChannelWatermarkImage = reshape(binaryBlueChannelWatermarkImage,[],8);

% chuyen binary sang dec (Convert binary to demical)
binaryRedChannelWatermarkImage = bi2de(binaryRedChannelWatermarkImage);
binaryGreenChannelWatermarkImage = bi2de(binaryGreenChannelWatermarkImage);
binaryBlueChannelWatermarkImage = bi2de(binaryBlueChannelWatermarkImage);

% Reshape lai (Reshape to original size of matrix)
RedChannelWatermarkImage = reshape(binaryRedChannelWatermarkImage,[watermarkImageRows, watermarkImageColumns]);
GreenChannelWatermarkImage = reshape(binaryGreenChannelWatermarkImage,[watermarkImageRows, watermarkImageColumns]);
BlueChannelWatermarkImage = reshape(binaryBlueChannelWatermarkImage,[watermarkImageRows, watermarkImageColumns]);

% Gop lai thanh anh mau (Combine to color image)
scrambledImage = cat(3, RedChannelWatermarkImage, GreenChannelWatermarkImage, BlueChannelWatermarkImage);
end

