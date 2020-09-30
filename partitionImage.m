function ca = partitionImage(hostImage)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Lay gia tri cac chieu khong gian cua hostImage, numberOfColorBands la 3
% neu la anh mau
[rows columns numberOfColorBands] = size(hostImage);

%==========================================================================
% Chia nho hostImage thanh cac block dung ham mat2cell();
% 2 bien duoi dung de chi ra kich thuoc moi block (theo do an se la 4x4)
blockSizeR = 4; % Row trong 1 block.
blockSizeC = 4; % Column trong 1 block.

% Tinh toan size cua cac block trong row
% Da phan se bang blockSizeR tuy nhien se bi du ra nhung phan thua o cuoi.
wholeBlockRows = floor(rows / blockSizeR);
blockVectorR = [blockSizeR * ones(1, wholeBlockRows), rem(rows, blockSizeR)];
% Tinh toan size cua cac block trong column
wholeBlockCols = floor(columns / blockSizeC);
blockVectorC = [blockSizeC * ones(1, wholeBlockCols), rem(columns, blockSizeC)];

% Tao cell array, ca.  
% Moi cell (tru cac cell con thua) trong array chua blockSizeR vaf
% blockSizeC va 3 mau array
% Dung ham mat2cell de partition thanh cac block con
if numberOfColorBands > 1
  % color image.
  ca = mat2cell(hostImage, blockVectorR, blockVectorC, numberOfColorBands);
else
  ca = mat2cell(hostImage, blockVectorR, blockVectorC);
end


end
