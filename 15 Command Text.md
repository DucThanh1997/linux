# Text Command
## Hiển thị nội dung

`cat` sẽ in ra màn hình toàn bộ nội dung file
```
cat thanh.txt

hello
bonjour
```

`tac` giống cat nhưng thứ tự các dòng in ra sẽ ngược lại
```
tac thanh.txt

bonjour
hello
```
`echo` chỉ đơn giản dùng để in ra màn hình

```buildoutcfg
echo thanh.txt
thanh.txt

```

## Sửa nội dung

`sed`  là kiểu find and replace

`sed -e "s/hello/xinchao/g"  thanh.txt`

tìm từ hello thay thế bằng từ xin chào

### awk
`awk` : là một ngôn ngữ lập trình hỗ trợ thao tác dễ dàng đối với kiểu dữ liệu có cấu trúc và tạo ra những kết quả được định dạng.

`Awk` thường được sử dụng cho việc tìm kiếm và xử lý text. Nó sẽ tìm kiếm một hoặc nhiều file để xem xem trong các file đó có dòng nào bao gồm những pattern (khuôn mẫu) cho trước hay không, sau đó thực hiện những action (hành động) tương ứng.

Cú pháp cơ bản của câu lệnh được viết với Awk sẽ như sau:
```
awk '/search pattern 1/ {Actions}
         /search pattern 2/ {Actions}' file
```

Ví dụ:
```
~ cat employee.txt
100  Thomas  Manager    Sales       $5,000
200  Jason   Developer  Technology  $5,500
300  Sanjay  Sysadmin   Technology  $7,000
400  Nisha   Manager    Marketing   $9,500
500  Randy   DBA        Technology  $6,000
```

In ra bình thường
```
awk '{print;}' employee.txt

100  Thomas  Manager    Sales       $5,000
200  Jason   Developer  Technology  $5,500
300  Sanjay  Sysadmin   Technology  $7,000
400  Nisha   Manager    Marketing   $9,500
500  Randy   DBA        Technology  $6,000
```

In ra cột từ cột Nisha trở xuống
```
awk '/Thomas/
quote> /Nisha/' employee.txt

100  Thomas  Manager    Sales       $5,000
400  Nisha   Manager    Marketing   $9,500
```

Chỉ in ra những trường nhất định
```buildoutcfg
 ~ awk '{print $2, $5;}' employee.txt
Thomas $5,000
Jason $5,500
Sanjay $7,000
Nisha $9,500
Randy $6,000
```

bạn có thể tìm hiểu thêm về awk tại : https://viblo.asia/p/tim-hieu-awk-co-ban-gGJ59229KX2

## Các loại lệnh khác
Lệnh `uniq` loại bỏ các dòng bị lặp trong file text

Lệnh `paste` để gộp hai file theo các dòng (gộp từng dòng một với nhau)

Lệnh `join` cũng để gộp hai file nhưng yêu cầu file đã được sắp xếp, sử dụng tùy chọn --nocheck-order để gộp mà không cần sắp xếp. Ví dụ:

`join --nocheck-order trang.txt trang2.txt`
Lệnh grep để tìm kiếm các từ khóa. Ví dụ tìm trong file tất cả các dòng bắt đầu bằng ký tự t

`grep ^t trang.txt`
Lệnh `tr.` Nếu muốn đổi hết chữ in thường thành in hoa ta dùng lệnh

`cat trang.txt | tr a-z A-Z`
Lệnh `tee` lấy output từ bất cứ cmd nào trong khi xuất ra output và lưu nó vào file

`ls -l | tee list.txt`
`wc` đến số dòng, số từ, số ký tự trong một file hoặc một list các file

Đếm số dòng
wc -l trang.txt
Đếm số ký tự
wc -c trang.txt
Đếm số từ
wc -w trang.txt

Lệnh `cut` làm việc với các cột trong file và thiết kế để xuất nội dung của một cột cụ thể. Phân cách mặc định là tab và có thể tùy chọn các cách cắt khác. Ví dụ cắt theo dấu cách " " và lấy ra cột đầu tiên

cut -d" " -f1 trang.txt
Lệnh `head` mặc định lấy 10 dòng đầu tiên. Ví dụ lấy 2 dòng đầu tiên của một file và hiển thị nó ra màn hình:

head -n 2 trang.txt
Lệnh tail mặc định in ra 10 dòng cuối cùng của file. In ra 3 dòng cuối của file ta dùng lệnh:

tail -f -n3 trang.txt
tailf hay tail -f thường được sử dụng cho file ghi log real-time, hai lệnh này sẽ cho phép tiếp tục xem file, nếu có dòng được add vào file, có sẽ được hiển thị thêm.
