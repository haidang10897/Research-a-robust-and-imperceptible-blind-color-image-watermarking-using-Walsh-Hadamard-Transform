function extractedWatermarkedBinaryBlock = calculateExtract(partitionWatermarkedImageChannel)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


d = abs(partitionWatermarkedImageChannel(3,:)-partitionWatermarkedImageChannel(4,:));
b = rem(floor(d),2);

extractedWatermarkedBinaryBlock = b;
end

