function watermarkImage = extract(watermarkedImagePath, keyPath)
% Doc file anh
watermarkedImage = imread(watermarkedImagePath);

% load key
key = load(keyPath);

% set che do full screen (dung de phong to ket qua cho de nhin)
%set(gcf, 'units','normalized','outerposition',[0 0 1 1]);

% extract kenh mau
watermarkedImageRedChannel = watermarkedImage(:,:,1); % Red channel
watermarkedImageGreenChannel = watermarkedImage(:,:,2); % Green channel
watermarkedImageBlueChannel = watermarkedImage(:,:,3); % Blue channel


% partition watermarked image
partitionWatermarkedImageRedChannel = partitionImage(watermarkedImageRedChannel);
partitionWatermarkedImageGreenChannel = partitionImage(watermarkedImageGreenChannel);
partitionWatermarkedImageBlueChannel = partitionImage(watermarkedImageBlueChannel);



% Buoc 2: WHT
% RED
redNumPlotsR = size(partitionWatermarkedImageRedChannel, 1); % Lay size cua row
redNumPlotsC = size(partitionWatermarkedImageRedChannel, 2); % Lay size cua column
for r = 1 : redNumPlotsR-1
  for c = 1 : redNumPlotsC-1
    whtPartitionWatermarkedImageRedChannel{r,c} = fwht(double(partitionWatermarkedImageRedChannel{r,c}),4,'hadamard');
  end
end

% GREEN
greenNumPlotsR = size(partitionWatermarkedImageGreenChannel, 1); % Lay size cua row
greenNumPlotsC = size(partitionWatermarkedImageGreenChannel, 2); % Lay size cua column
for r = 1 : greenNumPlotsR-1
  for c = 1 : greenNumPlotsC-1
    whtPartitionWatermarkedImageGreenChannel{r,c} = fwht(double(partitionWatermarkedImageGreenChannel{r,c}),4,'hadamard');
  end
end

% BLUE
blueNumPlotsR = size(partitionWatermarkedImageBlueChannel, 1); % Lay size cua row
blueNumPlotsC = size(partitionWatermarkedImageBlueChannel, 2); % Lay size cua column
for r = 1 : blueNumPlotsR-1
  for c = 1 : blueNumPlotsC-1
    whtPartitionWatermarkedImageBlueChannel{r,c} = fwht(double(partitionWatermarkedImageBlueChannel{r,c}),4,'hadamard');
  end
end

% Buoc 3: Trich xuat gia tri nhi phan cua anh thuy van
% Red channel

binaryBlockIndex = 1;
for r = 1 : redNumPlotsR-1
  for c = 1 : redNumPlotsC-1
      
    extractedWatermarkedBinaryRedBlock{binaryBlockIndex} = calculateExtract(whtPartitionWatermarkedImageRedChannel{r,c});
    binaryBlockIndex = binaryBlockIndex + 1;
      if binaryBlockIndex > (size(key,2)*8/4)
            break
      end
  end
  if binaryBlockIndex > (size(key,2)*8/4)
            break
      end
end

% Green Channel

binaryBlockIndex = 1;
for r = 1 : greenNumPlotsR-1
  for c = 1 : greenNumPlotsC-1
      
    extractedWatermarkedBinaryGreenBlock{binaryBlockIndex} = calculateExtract(whtPartitionWatermarkedImageGreenChannel{r,c});
    binaryBlockIndex = binaryBlockIndex + 1;
      if binaryBlockIndex > (size(key,2)*8/4)
            break
      end
  end
      if binaryBlockIndex > (size(key,2)*8/4)
            break
      end
end

% Blue Channel

binaryBlockIndex = 1;
for r = 1 : blueNumPlotsR-1
  for c = 1 : blueNumPlotsC-1
    
    extractedWatermarkedBinaryBlueBlock{binaryBlockIndex} = calculateExtract(whtPartitionWatermarkedImageBlueChannel{r,c});
    binaryBlockIndex = binaryBlockIndex + 1;
        if binaryBlockIndex > (size(key,2)*8/4)
            break
        end
      
  end
    if binaryBlockIndex > (size(key,2)*8/4)
            break
      end
end

% cell2mat
extractedWatermarkedBinaryRedBinary = cell2mat(extractedWatermarkedBinaryRedBlock);
extractedWatermarkedBinaryGreenBinary = cell2mat(extractedWatermarkedBinaryGreenBlock);
extractedWatermarkedBinaryBlueBinary = cell2mat(extractedWatermarkedBinaryBlueBlock);

extractedWatermarkedBinaryRedBinary = uint8(extractedWatermarkedBinaryRedBinary);
extractedWatermarkedBinaryGreenBinary = uint8(extractedWatermarkedBinaryGreenBinary);
extractedWatermarkedBinaryBlueBinary = uint8(extractedWatermarkedBinaryBlueBinary);

scrambledWatermarkImage = binaryToImage(extractedWatermarkedBinaryRedBinary, extractedWatermarkedBinaryGreenBinary, extractedWatermarkedBinaryBlueBinary,90,90);
watermarkImage = unscrambledImage(scrambledWatermarkImage, key);

end
