function embeddedWhtPartitionHostImage = calculateEmbed(whtPartitionHostImage,binaryBlock)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
d = abs(ceil(whtPartitionHostImage(3,:))-ceil(whtPartitionHostImage(4,:)));
avg = (ceil(whtPartitionHostImage(3,:))+ceil(whtPartitionHostImage(4,:)))/2;

for i=1:4
   
   if rem(abs(d(i)),2)==0
       if binaryBlock(i)==0
         l(i)=avg(i)-((d(i))/2);
         m(i)=avg(i)+((d(i))/2);
       elseif binaryBlock(i)==1
         l(i)=avg(i) - (((d(i))/2)-0.5);    
         m(i)=avg(i) + (((d(i))/2)-0.5);
       end
   elseif rem(abs(d(i)),2)==1
       if binaryBlock(i)==0
         l(i)=avg(i) - (((d(i))/2)-0.5);    
         m(i)=avg(i) + (((d(i))/2)-0.5);
       elseif binaryBlock(i)==1
         l(i)=avg(i)-((d(i))/2);
         m(i)=avg(i)+((d(i))/2);
       end
   end
   
end

for i=1:4
    if (whtPartitionHostImage(3,i)) >= (whtPartitionHostImage(4,i))
        e3i(i)=max(l(i),m(i));
    elseif (whtPartitionHostImage(3,i)) < (whtPartitionHostImage(4,i))
        e3i(i)=min(l(i),m(i));
    end
    
    if (whtPartitionHostImage(4,i)) > (whtPartitionHostImage(3,i)) %!!! LUU Y CHO NAY TRONG BAI BAO SAI CONG THUC, PHAI SUA LAI NHU BEN
        e4i(i)=max(l(i),m(i));
    elseif (whtPartitionHostImage(4,i)) <= (whtPartitionHostImage(3,i))
        e4i(i)=min(l(i),m(i));
    end
    
    
end

whtPartitionHostImage(3,:)=e3i;
whtPartitionHostImage(4,:)=e4i;
    
%output
embeddedWhtPartitionHostImage = whtPartitionHostImage;
end

