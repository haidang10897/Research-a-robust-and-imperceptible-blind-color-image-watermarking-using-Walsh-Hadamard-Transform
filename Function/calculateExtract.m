function extractedWatermarkedBinaryBlock = calculateExtract(partitionWatermarkedImageChannel)
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

% Input: 4x4 matrix block of Watermarked Image
% Output: 4 bit binary of Watermark Image that have been embedded

% Calculate extract process using given formula
d = abs(partitionWatermarkedImageChannel(3,:)-partitionWatermarkedImageChannel(4,:));
b = rem(floor(d),2);

% Output
extractedWatermarkedBinaryBlock = b;
end

