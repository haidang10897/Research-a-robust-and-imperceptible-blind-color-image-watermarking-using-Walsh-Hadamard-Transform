% Clear Workspace (phai co!!!)
clc;
clearvars;
close all;
workspace;
fontSize = 16;

% Doc file anh
watermarkImage = imread('.\lena.png');
hostImage = imread('.\lena.png');

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

% Hien thi ket qua xao tron va chuyen sang binary anh (test 1)
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

% Hien cac block sau khi phan manh (test 2)
% ca = cell array;
ca=partitionImage(hostImage);
plotIndex = 1;
numPlotsR = size(ca, 1);
numPlotsC = size(ca, 2);
for r = 1 : numPlotsR
  for c = 1 : numPlotsC
    fprintf('plotindex = %d,   c=%d, r=%d\n', plotIndex, c, r);
    % hien thi thu tu cac block anh
    subplot(numPlotsR, numPlotsC, plotIndex);
    % tao cac o de hien thi block anh
    rgbBlock = ca{r,c};
    imshow(rgbBlock); 
    [rowsB columnsB numberOfColorBandsB] = size(rgbBlock);
    % ten cac o chua block anh
    caption = sprintf('Block #%d of %d\n%d rows by %d columns', ...
      plotIndex, numPlotsR*numPlotsC, rowsB, columnsB);
    title(caption);
    drawnow;
    % Tang chi so index len 1 
    plotIndex = plotIndex + 1;
  end
end
