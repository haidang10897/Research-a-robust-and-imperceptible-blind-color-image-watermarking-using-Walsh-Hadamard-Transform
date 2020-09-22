function [scrambledImage] = binaryToImage(binaryRedChannelWatermarkImage, binaryGreenChannelWatermarkImage, binaryBlueChannelWatermarkImage)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% chuyen binary sang dec
binaryRedChannelWatermarkImage = bi2de(binaryRedChannelWatermarkImage);
binaryGreenChannelWatermarkImage = bi2de(binaryGreenChannelWatermarkImage);
binaryBlueChannelWatermarkImage = bi2de(binaryBlueChannelWatermarkImage);

% Reshape lai
RedChannelWatermarkImage = reshape(binaryRedChannelWatermarkImage,[512, 512]);
GreenChannelWatermarkImage = reshape(binaryGreenChannelWatermarkImage,[512, 512]);
BlueChannelWatermarkImage = reshape(binaryBlueChannelWatermarkImage,[512, 512]);

% Gop lai thanh anh mau
scrambledImage = cat(3, RedChannelWatermarkImage, GreenChannelWatermarkImage, BlueChannelWatermarkImage);
end

