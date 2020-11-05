function watermarkedImage = Embed(watermarkImagePath, hostImagePath, keyPath)
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

% Input: Watermark Image's path
%        Host Image's path
%        Key's path
% Output: Watermarked Image

% Doc file anh
watermarkImage = imread(watermarkImagePath);
hostImage = imread(hostImagePath);

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

% Load key
key = load(keyPath);

% Dung ham tu tao scrambledImage de xao tron anh thuy van 
ScrambledImage = scrambledImage(watermarkImage,key);

% Chuyen 3 kenh mau cua anh thuy van sau khi bi xao tron sang binary
[binaryRedChannelWatermarkImage, binaryGreenChannelWatermarkImage, binaryBlueChannelWatermarkImage] = imageToBinary(ScrambledImage);


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
    partitionHostImageRedChannel{r,c} = fwht(double(partitionHostImageRedChannel{r,c}),4,'hadamard');
  end
end

% WHT kenh Green
GreennumPlotsR = size(partitionHostImageGreenChannel, 1); % Lay size cua row
GreennumPlotsC = size(partitionHostImageGreenChannel, 2); % Lay size cua column
for r = 1 : GreennumPlotsR-1
  for c = 1 : GreennumPlotsC-1
    partitionHostImageGreenChannel{r,c} = fwht(double(partitionHostImageGreenChannel{r,c}),4,'hadamard');
  end
end

% WHT kenh Blue
BluenumPlotsR = size(partitionHostImageBlueChannel, 1); % Lay size cua row
BluenumPlotsC = size(partitionHostImageBlueChannel, 2); % Lay size cua column
for r = 1 : BluenumPlotsR-1
  for c = 1 : BluenumPlotsC-1
    partitionHostImageBlueChannel{r,c} = fwht(double(partitionHostImageBlueChannel{r,c}),4,'hadamard');
  end
end

% Buoc 4,5,6: Embed process
% Prepare
% Chia binary watermark thanh cac block 1x4 de nhung vao wht block
binaryRedChannelWatermarkImageBlock = partitionBinary(binaryRedChannelWatermarkImage);
binaryGreenChannelWatermarkImageBlock = partitionBinary(binaryGreenChannelWatermarkImage);
binaryBlueChannelWatermarkImageBlock = partitionBinary(binaryBlueChannelWatermarkImage);

% Embed red channel
binaryBlockIndex=1; % Count var
for r = 1 : RednumPlotsR-1 % bien dem block (phai tru 1 vi o cuoi cung khong co ma tran)
    for c = 1 : RednumPlotsC-1 % same as above
        partitionHostImageRedChannel{r,c} = calculateEmbed(partitionHostImageRedChannel{r,c},binaryRedChannelWatermarkImageBlock{binaryBlockIndex});
        binaryBlockIndex = binaryBlockIndex + 1;
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
        partitionHostImageGreenChannel{r,c} = calculateEmbed(partitionHostImageGreenChannel{r,c},binaryGreenChannelWatermarkImageBlock{binaryBlockIndex});
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
        partitionHostImageBlueChannel{r,c} = calculateEmbed(partitionHostImageBlueChannel{r,c},binaryBlueChannelWatermarkImageBlock{binaryBlockIndex});
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
    partitionHostImageRedChannel{r,c} = floor(ifwht(double(partitionHostImageRedChannel{r,c}),4,'hadamard'));
  end
end

% Inverse kenh Green
for r = 1 : GreennumPlotsR-1
  for c = 1 : GreennumPlotsC-1
    partitionHostImageGreenChannel{r,c} = floor(ifwht(double(partitionHostImageGreenChannel{r,c}),4,'hadamard'));
  end
end

% Inverse kenh Blue
for r = 1 : BluenumPlotsR-1
  for c = 1 : BluenumPlotsC-1
    partitionHostImageBlueChannel{r,c} = floor(ifwht(double(partitionHostImageBlueChannel{r,c}),4,'hadamard'));
  end
end

% Gop lai anh thuy van bi phan manh o 2 ria phai va duoi, sau do chuyen
% sang kieu double
% chuyen ve double
for c = 1 : RednumPlotsC
    
    partitionHostImageRedChannel{RednumPlotsR,c} = double(partitionHostImageRedChannel{RednumPlotsR,c});
    
end

for r = 1 : RednumPlotsR
    
    partitionHostImageRedChannel{r,RednumPlotsC} = double(partitionHostImageRedChannel{r,RednumPlotsC});
end
% Ghep kenh G

for c = 1 : GreennumPlotsC
    
    partitionHostImageGreenChannel{GreennumPlotsR,c} = double(partitionHostImageGreenChannel{GreennumPlotsR,c});
    
end

for r = 1 : GreennumPlotsR
    
    partitionHostImageGreenChannel{r,GreennumPlotsC} = double(partitionHostImageGreenChannel{r,GreennumPlotsC});
end
% Ghep kenh B

for c = 1 : BluenumPlotsC
    
    partitionHostImageBlueChannel{BluenumPlotsR,c} = double(partitionHostImageBlueChannel{BluenumPlotsR,c});
    
end

for r = 1 : BluenumPlotsR
    
    partitionHostImageBlueChannel{r,BluenumPlotsC} = double(partitionHostImageBlueChannel{r,BluenumPlotsC});
end

% Buoc 8: gop lai thanh anh da thuy van
% Doi nguoc lai tu cell thanh matrix
watermarkedhostImageRedChannel = cell2mat(partitionHostImageRedChannel);
watermarkedhostImageGreenChannel = cell2mat(partitionHostImageGreenChannel);
watermarkedhostImageBlueChannel = cell2mat(partitionHostImageBlueChannel);

% chuyen kieu ve uint8 (bat buoc de imshow doc duoc anh, de double thi chi
% doc duoc 0 va 1 tuc trang va den)
watermarkedhostImageRedChannel = uint8(watermarkedhostImageRedChannel);
watermarkedhostImageGreenChannel = uint8(watermarkedhostImageGreenChannel);
watermarkedhostImageBlueChannel = uint8(watermarkedhostImageBlueChannel);

% Combine lai
watermarkedImage = cat(3, watermarkedhostImageRedChannel,watermarkedhostImageGreenChannel, watermarkedhostImageBlueChannel);

end

