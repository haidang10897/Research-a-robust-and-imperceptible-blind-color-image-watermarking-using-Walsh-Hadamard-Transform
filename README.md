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
Bước 3.1: Duyệt các khối ma trận 4x4 từ trái sang phải, từ trên xuống dưới.
Bước 3.2: Dùng hàm FWHT để biến đổi các khối 4x4.

### Bước 4: Dùng công thức để nhúng 4 bit ảnh thủy vân vào các khối ảnh gốc 4x4 đã được biến đổi Walsh Hadamard
Bước 3.2: Nhúng các khối ảnh thủy vân nhị phân 1x4 vào từng khối 4x4.
Bước 3.3: Lặp lại cho đến khi nhúng hết các khối ảnh thủy vân nhị phân 1x4 vào 

### Bước 4: 
# How to use
WIP

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTU3MjM0NDQxNCwtMjAyMTY0NDY2NiwxNz
A5NjE3OTQxLDE0MDU3MzYyNThdfQ==
-->