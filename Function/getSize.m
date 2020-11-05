function PossiblePixel = getSize(HostImagePath)
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

% Input: Host Image path
%        Watermark Image path
% Output: Size of possible watermark image that can embed to Host Image

% Read images
HostImage = imread(HostImagePath);

% Get size of Watermark Image and Host Image
[HostImageR, HostImageC, HostImageChannel] = size(HostImage);

% Calculate
HostImageBlock = (HostImageR * HostImageC)/16;
MaxEmbedBit = 4 * HostImageBlock;
MaxEmbedPixel = MaxEmbedBit/8;

% Output
PossiblePixel = MaxEmbedPixel;

end

