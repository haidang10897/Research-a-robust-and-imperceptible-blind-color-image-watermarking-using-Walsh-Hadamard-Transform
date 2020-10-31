function binaryVectorArray = partitionBinary(binaryVector)
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

% Input: Binary matrix
% Output: 1x4 matrix block

% Lay gia tri cac chieu khong gian cua hostImage, numberOfColorBands la 3
% neu la anh mau
[rows columns numberOfColorBands] = size(binaryVector);

%==========================================================================
% Chia nho hostImage thanh cac block dung ham mat2cell();
% 2 bien duoi dung de chi ra kich thuoc moi block (theo do an se la 4x4)
blockSizeR = 1; % Row trong 1 block.
blockSizeC = 4; % Column trong 1 block.

% Tinh toan size cua cac block trong row
% Da phan se bang blockSizeR tuy nhien se bi du ra nhung phan thua o cuoi.
wholeBlockRows = floor(rows / blockSizeR);
blockVectorR = [blockSizeR * ones(1, wholeBlockRows)];
% Tinh toan size cua cac block trong column
wholeBlockCols = floor(columns / blockSizeC);
blockVectorC = [blockSizeC * ones(1, wholeBlockCols)];

% Tao cell array, ca.  
% Moi cell (tru cac cell con thua) trong array chua blockSizeR vaf
% blockSizeC va 3 mau array
% Dung ham mat2cell de partition thanh cac block con
if numberOfColorBands > 1
  % color image.
  binaryVectorArray = mat2cell(binaryVector, blockVectorR, blockVectorC, numberOfColorBands);
else
  binaryVectorArray = mat2cell(binaryVector, blockVectorR, blockVectorC);
end


end

