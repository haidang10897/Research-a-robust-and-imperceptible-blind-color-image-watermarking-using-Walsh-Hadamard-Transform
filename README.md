# Researching-a-robust-and-imperceptible-blind-color-image-watermarking-using-Walsh-Hadamard-Transform

# Information
Sinh viên: Trần Hải Đăng  		
Lớp: AT12ET  
Người hướng dẫn: Ths. Trần Thị Xuyên  
Đơn vị công tác: Học viện Kỹ thuật mật mã  
Đề tài: Nghiên cứu phương pháp thủy vân mù bền vững sử dụng biến đổi Walsh Hadamard  

# Embed Process
### Bước 1: Chuyển đổi ảnh thủy vân sang giá trị nhị phân sau khi đã xáo trộn dùng khóa K
Bước 1.1: Tách ảnh thủy vân thành 3 kênh màu Red, Green, Blue.  
Bước 1.2: Ở mỗi kênh màu, xáo trộn các pixel ảnh dùng khóa K.  
Bước 1.3: Ở mỗi kênh, chuyển đổi giá trị thập phân ở mỗi pixel ảnh sang giá trị nhị phân.  
Bước 1.4: Ở mỗi kênh, gộp dãy nhị phân thành các khối ma trận kích cỡ 1x4 để nhúng vào ảnh gốc.  

### Bước 2: Phân mảnh ảnh gốc thành các khối 4x4 pixel mà không bị trùng lặp
Bước 2.1: Tách ảnh gốc thành 3 kênh màu Red, Green, Blue.  
Bước 2.2: Ở mỗi kênh, chia ma trận thành các khối ma trận con 4x4 mà không bị trùng lặp (sẽ có những phần dư ra ở bên phải và bên dưới ảnh, nhưng ta sẽ không nhúng vào đó).  

### Bước 3: Áp dụng biến đổi Walsh Hadamard cho mỗi khối ảnh 4x4 của ảnh gốc
*Áp dụng các bước này với các kênh màu Red, Green, Blue.*  

Bước 3.1: Duyệt các khối ma trận 4x4 từ trái sang phải, từ trên xuống dưới.
Bước 3.2: Dùng hàm FWHT để biến đổi các khối 4x4.  

### Bước 4: Dùng công thức để nhúng 4 bit ảnh thủy vân vào các khối ảnh gốc 4x4 đã được biến đổi Walsh Hadamard
*Áp dụng các bước này với các kênh màu Red, Green, Blue. Ảnh thủy vân kênh Red thì nhúng vào ảnh gốc kênh Red, Green vào Green, Blue vào Blue.*  

Bước 4.1: Duyệt các khối ma trận 4x4 từ trái sang phải, từ trên xuống dưới.  
Bước 4.2: Nhúng các khối ảnh thủy vân nhị phân 1x4 vào từng khối 4x4 theo công thức đã có.  
Bước 4.3: Lặp lại cho đến khi nhúng hết các khối ảnh thủy vân nhị phân 1x4 vào.  
**LƯU Ý:** Công thức số 19 trong bài báo bị sai, phải là a4i>a3i và a4i<=a3i.  
**LƯU Ý 2:** Phải chọn kích cỡ ảnh thủy vân sao cho đủ dung lượng nhúng vừa với ảnh gốc, không được thừa.  Ví dụ ảnh gốc 512x512x3 thì phải chọn ảnh thủy vân 90x90x3 (Vì với kích thước vậy thì ảnh gốc sẽ chia ra được 16384 block 4x4 mỗi kênh màu và ảnh thủy vân sẽ có 16200 block 1x4 để nhúng vào, gần vừa đủ).

### Bước 5: Tìm giá trị Floor cho mỗi khối WHT 4x4 sau khi tính ngược lại.
*Áp dụng các bước này với các kênh màu Red, Green, Blue.*
Bước 5.1: Sau khi đã nhúng xong, ta đảo ngược giá trị WHT của mỗi khối 4x4 bằng hàm ifwht().
Bước 5.2: Tìm Floor cho mỗi khối 4x4 vừa nghịch đảo bằng hàm floor().

### Bước 6: Gộp lại thành ảnh đã được thủy vân
*Áp dụng các bước này với các kênh màu Red, Green, Blue.*
Bước 6.1: Duyệt từ trái sang phải, từ trên xuống dưới các khối 4x4.
Bước 6.2: Tách các khối lại thành ma trận bằng hàm cell2mat
Bước 6.3: Gộp 3 kênh màu lại.

# Extract Process
### Bước 1: 
# How to use
WIP

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTI1MjQ0NzUwNSw2OTEyMTIwMTksLTIwMj
E2NDQ2NjYsMTcwOTYxNzk0MSwxNDA1NzM2MjU4XX0=
-->