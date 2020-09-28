% Clear Workspace (phai co!!!)
clc;
clearvars;
close all;
workspace;
fontSize = 16;

% Doc file anh
watermarkImage = imread('.\android.png');
hostImage = imread('.\lena.png');

% Trich xuat kenh mau.
watermarkImageRedChannel = watermarkImage(:,:,1); % Red channel
watermarkImageGreenChannel = watermarkImage(:,:,2); % Green channel
watermarkImageBlueChannel = watermarkImage(:,:,3); % Blue channel

hostImageRedChannel = hostImage(:,:,1); % Red channel
hostImageGreenChannel = hostImage(:,:,2); % Green channel
hostImageBlueChannel = hostImage(:,:,3); % Blue channel

% Buoc 1: Xao tron anh thuy van

% Lay dimension (3 chieu khong gian) cua anh thuy van (bao gom chieu dai,
% chieu rong va chieu cao (3 kenh mau)).
[watermarkImageRows, watermarkImageColumns, watermarkImageNumberOfColorBands] = size(watermarkImage);

% Tao key bang cach random vi tri xao tron (dung ham randperm)
key = load('.\MyMatrix.txt');

%key = randperm(watermarkImageRows*watermarkImageColumns);
%save('MyMatrix.txt', 'key', '-ascii', '-tabs')

% set che do full screen (dung de phong to ket qua cho de nhin)
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);

% Dung ham tu tao scrambledImage de xao tron anh thuy van 
scrambledImage = scrambledImage(watermarkImage,key);

% Chuyen 3 kenh mau cua anh thuy van sau khi bi xao tron sang binary
[binaryRedChannelWatermarkImage, binaryGreenChannelWatermarkImage, binaryBlueChannelWatermarkImage] = imageToBinary(scrambledImage);

% Chuyen binary moi kenh sang cac ma tran 1x4
%blockBinaryRedChannelWatermarkImage = mat2cell(binaryRedChannelWatermarkImage, 1, 4);
% Hien thi ket qua xao tron va chuyen sang binary anh (test 1)


subplot(2, 2, 1);
imshow(watermarkImage);
title('Anh thuy van goc', 'FontSize', fontSize);

subplot(2, 2, 2);
imshow(scrambledImage);
title('Anh thuy van sau khi xao tron', 'FontSize', fontSize);

bi2dec=binaryToImage(binaryRedChannelWatermarkImage, binaryGreenChannelWatermarkImage, binaryBlueChannelWatermarkImage, watermarkImageRows, watermarkImageColumns);
subplot(2, 2, 3);
imshow(bi2dec);
title('Anh thuy van sau khi khoi phuc lai tu binary', 'FontSize', fontSize);

recoverWatermarkImage = unscrambledImage(bi2dec,key);
subplot(2, 2, 4);
imshow(recoverWatermarkImage);
title('Anh thuy van goc sau khi khoi phuc lai tu scamble', 'FontSize', fontSize);


% Hien cac block sau khi phan manh (test 2)
% ca = cell array;
%{
ca=partitionImage(hostImageRedChannel);
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
%}

% Buoc 2: Phan manh hostImage thanh cac khoi 4x4 khong bi trung lap
% Phan manh cac kenh mau cua hostImage
partitionHostImageRedChannel = partitionImage(hostImageRedChannel);
partitionHostImageGreenChannel = partitionImage(hostImageGreenChannel);
partitionHostImageBlueChannel = partitionImage(hostImageBlueChannel);

% Buoc 3: WHT cho tung block 
% WHT kenh RED
RednumPlotsR = size(partitionHostImageRedChannel, 1); % Lay size cua row
RednumPlotsC = size(partitionHostImageRedChannel, 2); % Lay size cua column
for r = 1 : RednumPlotsR-1
  for c = 1 : RednumPlotsC-1
    whtPartitionHostImageRedChannel{r,c} = fwht(double(partitionHostImageRedChannel{r,c}),4,'hadamard');
  end
end

% WHT kenh Green
GreennumPlotsR = size(partitionHostImageGreenChannel, 1); % Lay size cua row
GreennumPlotsC = size(partitionHostImageGreenChannel, 2); % Lay size cua column
for r = 1 : GreennumPlotsR-1
  for c = 1 : GreennumPlotsC-1
    whtPartitionHostImageGreenChannel{r,c} = fwht(double(partitionHostImageGreenChannel{r,c}),4,'hadamard');
  end
end

% WHT kenh Blue
BluenumPlotsR = size(partitionHostImageBlueChannel, 1); % Lay size cua row
BluenumPlotsC = size(partitionHostImageBlueChannel, 2); % Lay size cua column
for r = 1 : BluenumPlotsR-1
  for c = 1 : BluenumPlotsC-1
    whtPartitionHostImageBlueChannel{r,c} = fwht(double(partitionHostImageBlueChannel{r,c}),4,'hadamard');
  end
end

% Buoc 4,5,6: Embed process
% Prepare
% Chia binary watermark thanh cac block 1x4 de nhung vao wht block
binaryRedChannelWatermarkImageBlock = partitionBinary(binaryRedChannelWatermarkImage);
binaryGreenChannelWatermarkImageBlock = partitionBinary(binaryGreenChannelWatermarkImage);
binaryBlueChannelWatermarkImageBlock = partitionBinary(binaryBlueChannelWatermarkImage);
% Embed red channel
binaryBlockIndex=1;

for r = 1 : RednumPlotsR-1 % bien dem block (phai tru 1 vi o cuoi cung khong co ma tran)
    for c = 1 : RednumPlotsC-1 % same as above  
        
            whtPartitionHostImageRedChannel{r,c} = calculateEmbed(whtPartitionHostImageRedChannel{r,c},binaryRedChannelWatermarkImageBlock{binaryBlockIndex});
            binaryBlockIndex= binaryBlockIndex + 1;
            if binaryBlockIndex > size(binaryRedChannelWatermarkImageBlock, 2)
            break
            end
        
    end
            if binaryBlockIndex > size(binaryRedChannelWatermarkImageBlock, 2)
            break
            end
end
   
% Embed green channel
binaryBlockIndex=1;

for r = 1 : GreennumPlotsR-1 % bien dem block (phai tru 1 vi o cuoi cung khong co ma tran)
    for c = 1 : GreennumPlotsC-1 % same as above  
       
            whtPartitionHostImageGreenChannel{r,c} = calculateEmbed(whtPartitionHostImageGreenChannel{r,c},binaryGreenChannelWatermarkImageBlock{binaryBlockIndex});
            binaryBlockIndex= binaryBlockIndex + 1;
            if binaryBlockIndex > size(binaryGreenChannelWatermarkImageBlock, 2)
            break
            end
    end
        if binaryBlockIndex > size(binaryGreenChannelWatermarkImageBlock, 2)
            break
            end
end
    


% Embed blue channel
binaryBlockIndex=1;

for r = 1 : BluenumPlotsR-1 % bien dem block (phai tru 1 vi o cuoi cung khong co ma tran)
    for c = 1 : BluenumPlotsC-1 % same as above  
        
            whtPartitionHostImageBlueChannel{r,c} = calculateEmbed(whtPartitionHostImageBlueChannel{r,c},binaryBlueChannelWatermarkImageBlock{binaryBlockIndex});
            binaryBlockIndex= binaryBlockIndex + 1;
            if binaryBlockIndex > size(binaryBlueChannelWatermarkImageBlock, 2)
            break
            end
    end
            if binaryBlockIndex > size(binaryBlueChannelWatermarkImageBlock, 2)
            break
            end
end

% Buoc 7: Floor moi subblock va dao nguoc WHT bang ham IFWHT
% Inverse kenh Red
for r = 1 : RednumPlotsR-1
  for c = 1 : RednumPlotsC-1
    inversePartitionHostImageRedChannel{r,c} = floor(ifwht(double(whtPartitionHostImageRedChannel{r,c}),4,'hadamard'));
  end
end

% Inverse kenh Green
for r = 1 : GreennumPlotsR-1
  for c = 1 : GreennumPlotsC-1
    inversePartitionHostImageGreenChannel{r,c} = floor(ifwht(double(whtPartitionHostImageGreenChannel{r,c}),4,'hadamard'));
  end
end

% Inverse kenh Blue
for r = 1 : BluenumPlotsR-1
  for c = 1 : BluenumPlotsC-1
    inversePartitionHostImageBlueChannel{r,c} = floor(ifwht(double(whtPartitionHostImageBlueChannel{r,c}),4,'hadamard'));
  end
end

% Buoc 8: gop lai thanh anh da thuy van
% Doi nguoc lai tu cell thanh matrix
watermarkedhostImageRedChannel = cell2mat(inversePartitionHostImageRedChannel);
watermarkedhostImageGreenChannel = cell2mat(inversePartitionHostImageGreenChannel);
watermarkedhostImageBlueChannel = cell2mat(inversePartitionHostImageBlueChannel);

% chuyen kieu ve uint8 (bat buoc de imshow doc duoc anh, de double thi chi
% doc duoc 0 va 1 tuc trang va den)
watermarkedhostImageRedChannel = uint8(watermarkedhostImageRedChannel);
watermarkedhostImageGreenChannel = uint8(watermarkedhostImageGreenChannel);
watermarkedhostImageBlueChannel = uint8(watermarkedhostImageBlueChannel);

% Combine lai
watermarkedImage = cat(3, watermarkedhostImageRedChannel,watermarkedhostImageGreenChannel, watermarkedhostImageBlueChannel);
imwrite(watermarkedImage,'lena_watermarked.png');

subplot(2, 2, 1);
imshow(hostImage);
title('Anh goc', 'FontSize', fontSize);

subplot(2, 2, 2);
imshow(watermarkedImage);
title('Anh da thuy van', 'FontSize', fontSize);

subplot(2, 2, 3);
histogram(hostImage)
title('Anh goc', 'FontSize', fontSize);

subplot(2, 2, 4);
histogram(watermarkedImage)
title('Anh tv', 'FontSize', fontSize);

