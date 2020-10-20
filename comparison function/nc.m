function ncResult = nc(watermarkedImage,hostImage)
% Doc file anh
watermarkedImage = imread('lena_watermarked.png');
hostImage = imread('lena.png');

% Trich xuat kenh mau.
% Trich xuat R, G, B cua anh da thuy van
watermarkedImageRedChannel = watermarkedImage(:,:,1); % Red channel
watermarkedImageGreenChannel = watermarkedImage(:,:,2); % Green channel
watermarkedImageBlueChannel = watermarkedImage(:,:,3); % Blue channel

% Trich xuat R, G, B cua anh goc
hostImageRedChannel = hostImage(:,:,1); % Red channel
hostImageGreenChannel = hostImage(:,:,2); % Green channel
hostImageBlueChannel = hostImage(:,:,3); % Blue channel

%Tinh toan NC cua tung kenh mau
ncRedChannel = max(max(normxcorr2(watermarkedImageRedChannel(:,:),hostImageRedChannel(:,:))));
ncGreenChannel = max(max(normxcorr2(watermarkedImageGreenChannel(:,:),hostImageGreenChannel(:,:))));
ncBlueChannel = max(max(normxcorr2(watermarkedImageBlueChannel(:,:),hostImageBlueChannel(:,:))));

%Ket qua NC = AVG NC cua 3 kenh mau
ncResult = (ncRedChannel + ncGreenChannel + ncBlueChannel)/3;
end