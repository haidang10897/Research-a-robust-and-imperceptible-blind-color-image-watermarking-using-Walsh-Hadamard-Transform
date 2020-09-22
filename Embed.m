% Clear
clc;
clearvars;
close all;
workspace;
fontSize = 16;

% Doc file anh
watermarkImage = imread('.\lena.png');

% Trich xuat kenh mau.
redChannel = watermarkImage(:,:,1); % Red channel
greenChannel = watermarkImage(:,:,2); % Green channel
blueChannel = watermarkImage(:,:,3); % Blue channel

% Buoc 1: Xao tron anh thuy van

% Lay dimension (3 chieu khong gian) cua anh thuy van (bao gom chieu dai,
% chieu rong va chieu cao (3 kenh mau)).
[watermarkImageRows, watermarkImageColumns, watermarkImageNumberOfColorBands] = size(watermarkImage);

% Tao key bang cach random vi tri xao tron (dung ham randperm)
key = load('.\MyMatrix.txt');

%key = randperm(watermarkImageRows*watermarkImageColumns);
%save('MyMatrix.txt', 'key', '-ascii', '-double', '-tabs')

% set che do full screen (dung de phong to ket qua cho de nhin)
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);

% Dung ham tu tao scrambledImage de xao tron anh thuy van 
scrambledImage = scrambledImage(watermarkImage,key);

% Chuyen 3 kenh mau cua anh thuy van sau khi bi xao tron sang binary
[binaryRedChannelWatermarkImage, binaryGreenChannelWatermarkImage, binaryBlueChannelWatermarkImage] = imageToBinary(scrambledImage);

% Hien thi ket qua (test)
subplot(2, 2, 1);
imshow(watermarkImage);
title('Anh thuy van goc', 'FontSize', fontSize);

subplot(2, 2, 2);
imshow(scrambledImage);
title('Anh thuy van sau khi xao tron', 'FontSize', fontSize);

bi2dec=binaryToImage(binaryRedChannelWatermarkImage, binaryGreenChannelWatermarkImage, binaryBlueChannelWatermarkImage);
subplot(2, 2, 3);
imshow(bi2dec);
title('Anh thuy van sau khi khoi phuc lai tu binary', 'FontSize', fontSize);

recoverWatermarkImage = unscrambledImage(bi2dec,key);
subplot(2, 2, 4);
imshow(recoverWatermarkImage);
title('Anh thuy van goc sau khi khoi phuc lai tu binary', 'FontSize', fontSize);


