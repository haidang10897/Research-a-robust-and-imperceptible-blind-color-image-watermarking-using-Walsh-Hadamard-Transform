function [watermarkImage] = unscrambledImage(scrambledImage,key)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

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

watermarkImage = cat(3, redChannel, greenChannel, blueChannel);
end

