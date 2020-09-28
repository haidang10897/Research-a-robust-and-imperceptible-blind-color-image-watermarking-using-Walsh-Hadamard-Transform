function [binaryRedChannelWatermarkImage, binaryGreenChannelWatermarkImage, binaryBlueChannelWatermarkImage] = imageToBinary(scrambledImage)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

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

