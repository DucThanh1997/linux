# file shadow
## Định nghĩa: 
Full thì là /etc/shadow. mục đích của nó để chứa mật khẩu đã được mã hóa. Bạn có thể nghĩ các password được lưu ở /etc/passwd
nhưng không nó được lưu ở đây

## Cấu trúc:
` Username:Password-encode:last_pass_change:maxday:maximum:warn:inactive:expire`

1. Username : Tên người dùng.
2. Password-encode : Mật khẩu người sử dụng được mã hóa bởi các thuật toán khác nhau tùy từng distro.

         $1$i.c8pVks$KGiRzVYjr8uRZUYzwQxcL1
         
  Được phân cách thành 3 trường bởi $.
  
    - Trường 1: Cho biết thuật tóan mã hóa.
    
            $1 : MD5
            
            $2 : blowfish
            
            $2a : eksblowfish
            
            $5 : sha256
            
            $6 : sha512'
            
    - Trường 2: Là một chuỗi dữ liệu ngẫu nhiên (salt) kết hợp với pass người dùng, tăng tính bảo mật trong hàm băm.
    - Trường 3: Giá trị băm của salt với password

  Nếu tại password-encode mà :
  
           - rỗng, nghĩa là không có mật khẩu.
           
           - ! , nghĩa là mật khẩu người dùng bị chặn, nhưng có thể sử dụng phương thức khác để connect, như ssh key.
           
           - *, nghĩa là mật khẩu bị chặn, vẫn có thể connect bằng phương thức khác.

3. last_pass_change : Thời gian từ ngày 1/1/1970 tới lần thay đổi mật khẩu gần nhất (tính bằng ngày).

4. maxday : Thời gian tối đa để thay đôi mật khẩu. 0 là thay đổi bất kỳ lúc nào ( tính bằng ngày ).

5. maximum : Thời gian mật khẩu còn thời hạn ( tính bằng ngày ).

6. warn : Thời gian cảnh báo mật khẩu sắp hết hạn ( tính bằng ngày)

7. inactive : Thời gian mà mật khẩu người dùng hết hạn (tính bằng ngày )

8. expire : Thời gian mà người dùng bị vô hiêu hóa, tính từ ngày 1/1/1970 ( tính bằng ngày ).

Ví dụ:
` root:$1$i.c8pVks$KGiRzVYjr8uRZUYzwQxcL1:16262:0:99999:7:::`

## Hướng dẫn cách đổi pass trong /etc/shadow
- Tải mkpasswd về bằng lệnh: `sudo apt-get whois`
- Tạo password bằng thuật toán sha-512: `mkpasswd -m sha-512 YourPassword`
- Sau đó copy đoạn pass đã được mã hóa rồi paste thay thế vào mục passwordencode trong /etc/shadow

# Netstat 
## Định nghĩa
netstat giám sát cả chiều in và chiều out kết nối vào server, hoặc các tuyến đường route, trạng thái của card mạng.
lệnh netstat rất hữu dụng trong việc giải quyết các vấn đề về sự cố liên quan đến network như là lượng connect kết nối, traffic, tốc độ, trạng thái của từng port, Ip …
## Các thông số
- Recv-Q: Số byte không được sao chép bởi chương trình người dùng được kết nối với ổ cắm này.
- Send-Q: Số byte không được máy chủ từ xa thừa nhận.
- Proto: Cho biết kế nối là TCP hay UDP
- Local address: Địa chỉ IP của máy tính địa phương và số cổng được sử dụng. Tên của máy tính địa phương tương ứng với địa chỉ IP và tên của cảng được hiển thị trừ khi tham số -n được quy định cụ thể. Nếu cổng chưa được thành lập, số cổng phải được thể hiện như là một dấu sao (*).
- Foreign address: Địa chỉ IP và số cổng của máy tính từ xa mà ổ cắm được kết nối. Các tên tương ứng với địa chỉ IP và cổng được hiển thị trừ khi tham số -n được quy định cụ thể. Nếu cổng chưa được thành lập, số cổng phải được thể hiện như là một dấu sao (*)
- State: Cho biết trang thái cổng: Cho biết trạng thái của một kết nối TCP. 
## Các câu lệnh thường dùng
- `netstat -at`: Kiểm tra các port đang sử dụng phương phức TCP
- `netstat -au`: Kiểm tra các port đang sử dụng phương phức UDP
- `netstat -lt`: Kiểm tra các port đang listen dùng phương thức TCP

# kill -0
kill -0 <pid> just gives a return value 0 if the process exists, and 1 if it doesn't.

