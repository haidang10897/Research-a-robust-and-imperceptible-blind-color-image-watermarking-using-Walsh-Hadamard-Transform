function [watermarkImage] = unscrambledImage(scrambledImage,key)
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

% Input: Scrambled image matrix
%        Loaded key
% Output: Unscrambled image

% lay 3 chieu khong gian cua scrambledImage
[rows, columns, numberOfColorBands] = size(scrambledImage);
redChannel = scrambledImage(:, :, 1);
greenChannel = scrambledImage(:, :, 2);
blueChannel = scrambledImage(:, :, 3);

% Tao 1 ma tran recoverOrder de sap xep lai pixel anh theo trat tu cua key
recoverOrder = zeros([rows*columns], 2);
recoverOrder(:, 1) = 1 : (rows*columns);
recoverOrder(:, 2) = key;

% Dua theo ma tran recoverOrder de sap xep lai
newOrder = sortrows(recoverOrder, 2);

% Trich xuat ma tran thu tu sap xep
newOrder = newOrder(:,1);

% Bat dau sap xep lai cac kenh mau theo thu tu 
redChannel = redChannel(newOrder);
greenChannel = greenChannel(newOrder);
blueChannel = blueChannel(newOrder);

% Reshape lai
redChannel = reshape(redChannel, [rows, columns]);
greenChannel = reshape(greenChannel, [rows, columns]);
blueChannel = reshape(blueChannel, [rows, columns]);

% Output
watermarkImage = cat(3, redChannel, greenChannel, blueChannel);
end

