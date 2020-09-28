function [scrambledImage] = binaryToImage(binaryRedChannelWatermarkImage, binaryGreenChannelWatermarkImage, binaryBlueChannelWatermarkImage, watermarkImageRows, watermarkImageColumns)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% chuyen vecto cot sang matrix
binaryRedChannelWatermarkImage = reshape(binaryRedChannelWatermarkImage,[],8);
binaryGreenChannelWatermarkImage = reshape(binaryGreenChannelWatermarkImage,[],8);
binaryBlueChannelWatermarkImage = reshape(binaryBlueChannelWatermarkImage,[],8);

% chuyen binary sang dec
binaryRedChannelWatermarkImage = bi2de(binaryRedChannelWatermarkImage);
binaryGreenChannelWatermarkImage = bi2de(binaryGreenChannelWatermarkImage);
binaryBlueChannelWatermarkImage = bi2de(binaryBlueChannelWatermarkImage);

% Reshape lai


RedChannelWatermarkImage = reshape(binaryRedChannelWatermarkImage,[watermarkImageRows, watermarkImageColumns]);
GreenChannelWatermarkImage = reshape(binaryGreenChannelWatermarkImage,[watermarkImageRows, watermarkImageColumns]);
BlueChannelWatermarkImage = reshape(binaryBlueChannelWatermarkImage,[watermarkImageRows, watermarkImageColumns]);
% Gop lai thanh anh mau
scrambledImage = cat(3, RedChannelWatermarkImage, GreenChannelWatermarkImage, BlueChannelWatermarkImage);
end

