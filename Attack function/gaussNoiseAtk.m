function AttackedWatermarkedImage = gaussNoiseAtk(WatermarkedImagePath, variance)
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
% Depend on the MATLAB algorithm, we must divide to 255^2
% See: https://www.mathworks.com/matlabcentral/answers/390682-code-for-white-gaussian-noise-for-image
AttackedWatermarkedImage = imnoise(I, 'gaussian', 0, variance/255^2);
end

