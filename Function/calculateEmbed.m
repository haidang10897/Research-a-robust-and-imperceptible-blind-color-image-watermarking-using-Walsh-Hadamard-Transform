function embeddedWhtPartitionHostImage = calculateEmbed(whtPartitionHostImage,binaryBlock)
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

% Input: 4x4 matrix block of WHT Host Image
%        4 bit binary of Watermark Image
% Output: Embedded watermark 4x4 matrix block 

% Prepare variable
d = abs(floor(whtPartitionHostImage(3,:))-floor(whtPartitionHostImage(4,:)));
avg = (floor(whtPartitionHostImage(3,:))+floor(whtPartitionHostImage(4,:)))/2;

% Begin calculate using given formula
for i=1:4
    if rem(abs(d(i)),2) == 0
        if binaryBlock(i) == 0
            l(i)=avg(i)-((d(i))/2);
            m(i)=avg(i)+((d(i))/2);
        elseif binaryBlock(i) == 1
            l(i)=avg(i) - (((d(i))/2)-0.5);
            m(i)=avg(i) + (((d(i))/2)-0.5);
        end
    elseif rem(abs(d(i)),2) == 1
        if binaryBlock(i)==0
            l(i)=avg(i) - (((d(i))/2)-0.5);
            m(i)=avg(i) + (((d(i))/2)-0.5);
        elseif binaryBlock(i) == 1
            l(i)=avg(i)-((d(i))/2);
            m(i)=avg(i)+((d(i))/2);
        end
    end
end

for i=1:4
    if (whtPartitionHostImage(3,i)) >= (whtPartitionHostImage(4,i))
        e3i(i) = max(l(i), m(i));
    elseif (whtPartitionHostImage(3,i)) < (whtPartitionHostImage(4,i))
        e3i(i) = min(l(i), m(i));
    end
    %!!! LUU Y CHO NAY TRONG BAI BAO SAI CONG THUC, PHAI SUA LAI NHU DUOI!!
    % Caution: The formula given in the article is wrong!!! I fixed it 
    if (whtPartitionHostImage(4,i)) > (whtPartitionHostImage(3,i)) 
        e4i(i) = max(l(i), m(i));
    elseif (whtPartitionHostImage(4,i)) <= (whtPartitionHostImage(3,i))
        e4i(i) = min(l(i), m(i));
    end
end

% Change the third and fourth row of matrix to the coeffient we calculated
% above
whtPartitionHostImage(3,:) = e3i;
whtPartitionHostImage(4,:) = e4i;

% Output
embeddedWhtPartitionHostImage = whtPartitionHostImage;
end

