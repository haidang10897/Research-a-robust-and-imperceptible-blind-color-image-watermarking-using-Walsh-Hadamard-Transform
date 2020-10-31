function [binaryRedChannelWatermarkImage, binaryGreenChannelWatermarkImage, binaryBlueChannelWatermarkImage] = imageToBinary(scrambledImage)
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

% Input: Image matrix
% Output: Red channel's binary
%         Green channel's binary
%         Blue channel's binary

% Trich xuat kenh mau.
RedChannelWatermarkImage = scrambledImage(:,:,1); % Red channel
GreenChannelWatermarkImage = scrambledImage(:,:,2); % Green channel
BlueChannelWatermarkImage = scrambledImage(:,:,3); % Blue channel

% Chuyen moi kenh mau sang gia tri nhi phan (binary)
binaryRedChannelWatermarkImage = de2bi(RedChannelWatermarkImage);
binaryGreenChannelWatermarkImage = de2bi(GreenChannelWatermarkImage);
binaryBlueChannelWatermarkImage = de2bi(BlueChannelWatermarkImage);

% chuyen thanh vecto hang
binaryRedChannelWatermarkImage = reshape(binaryRedChannelWatermarkImage,1,[]);
binaryGreenChannelWatermarkImage = reshape(binaryGreenChannelWatermarkImage,1,[]);
binaryBlueChannelWatermarkImage = reshape(binaryBlueChannelWatermarkImage,1,[]);

end

