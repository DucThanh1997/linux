# Bash Shell Programing
## Định nghĩa
Shell kiểu terminal cũng dùng để chạy lệnh
```
#!/bin/bash
find /usr/lib -name "*.c" -ls
```
nhưng mà dòng đầu tiên bắt buộc phải có `#!/bin/bash`

## Bash Script
Chúng ta có thể chạy từng lệnh 1 rồi enter nhưng có cách hay ho hơn là ghi tất cả các lệnh vào 1 file rồi chạy nó 1 thể

Chúng ta sẽ tạo 1 file sh
`touch thanh.sh`

sau đó chỉnh sửa file sh đó bằng lệnh: `sudo nano thanh.sh`
bên trong file gõ 
```
#~/bin/bash                                                                                                                                                                                                                                     
echo "Thanh dep trai" 
```
Bây giờ ta chạy lệnh `bash thanh.sh`

Terminal sẽ trả về `Thanh dep trai`

## Biến trong Bash 
Có 2 kiểu biến
- Biến của hệ thống: luôn viết hoa tất cả
- Biến do người dùng đặt: luôn bắt đầu bằng 1 kí tự

# Gán giá trị cho biến
Bắt buộc phải như này làm kiểu khác là sai ngay
a=10

## echo
echo như kiểu in ra ấy
Ví dụ
echo "Thanh dep trai"         in ra Thanh dep trai
echo $a                       in ra 10

## Câu lệnh if

Lệnh rẽ nhánh if
Giới thiệu
Cũng như các ngôn ngữ lập trình, với một danh sách dài các lệnh thì không thể thiếu được câu lệnh rẽ nhánh cơ bản để kiểm tra xem điều kiện đúng hay sai mà thực thi những việc mình cần.

Câu lệnh đơn giản nhất sẽ có cấu trúc như dưới :
```
if điều kiện
then
	1 hoặc nhiều câu lệnh ở đây
fi
```
Và đương nhiên chúng ta sẽ có else như bao ngôn ngữ khác
```
if điều kiện
then
	1 hoặc nhiều câu lệnh ở đây
else
    xử lý khác ở đây
fi
```
Nhưng với elseif thì shell viết hơi khác 1 chút là elif, nhưng bạn cũng có thể dufngbao nhiêu elif tùy thích.
```
if điều kiện 1
then
	xử lý 1
elif điều kiện 2
then
	xử lý 2
fi
```

## Vòng lặp
### For

Sau đây là cú pháp của vòng lặp for :
```
#!/bin/bash
for A in 1 2 3
do
	echo $A
done
```

### While

Như bao ngôn ngữ khác thì While sẽ lặp đến khi điều kiện chỉ định còn là true.
```
#!/bin/bash
# lặp từ 1 đến khi bằng 100 thì thôi, in ra từ 1 ~ 99
A=1
while [ $X -le 99 ]
do
	echo $X
	X=$((X+1))
done

```







