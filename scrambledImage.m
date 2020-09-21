function scrambledImage = scrambledImage(watermarkImage,key)


%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Bien global
fontSize = 16;

% Lay dimension (3 chieu khong gian) cua anh thuy van (bao gom chieu dai,
% chieu rong va chieu cao (3 kenh mau)).
[rows, columns, numberOfColorBands] = size(watermarkImage);


% Trich xuat kenh mau.
redChannel = watermarkImage(:, :, 1);
greenChannel = watermarkImage(:, :, 2);
blueChannel = watermarkImage(:, :, 3);

% Xao tron anh theo Key da duoc truyen vao ham (key o day don gian la thu
% tu xao tron)
redChannel = redChannel(key);
greenChannel = greenChannel(key);
blueChannel = blueChannel(key);

% Key la 1 ma tran cot, sau khi xong doan code ben tren thi 3 kenh mau la 3
% ma tran cot. Gio phai reshape lai thanh ma tran ban dau.
redChannel = reshape(redChannel, [rows, columns]);
greenChannel = reshape(greenChannel, [rows, columns]);
blueChannel = reshape(blueChannel, [rows, columns]);

% Sau khi co 3 ma tran cua 3 kenh mau, gio ghep lai thanh 1 anh mau.
scrambledImage = cat(3, redChannel, greenChannel, blueChannel);


end

