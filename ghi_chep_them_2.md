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

## TCP và UDP
### Định nghĩa:
TCP (Transmission Control Protocol): Sử dụng TCP, các ứng dụng trên các máy chủ được nối mạng có thể tạo các "kết nối" với nhau, mà qua đó chúng có thể trao đổi dữ liệu hoặc các gói tin. Giao thức này đảm bảo chuyển giao dữ liệu tới nơi nhận một cách đáng tin cậy và đúng thứ tự. 

UDP (User Control Protocol): Dùng UDP, chương trình trên mạng máy tính có thể gởi những dữ liệu ngắn được gọi là datagram tới máy khác. UDP không cung cấp sự tin cậy và thứ tự truyền nhận mà TCP làm; các gói dữ liệu có thể đến không đúng thứ tự hoặc bị mất mà không có thông báo. Tuy nhiên UDP nhanh và hiệu quả hơn đối với các mục tiêu như kích thước nhỏ và yêu cầu khắt khe về thời gian

### Giống nhau:
Giống nhau : đều là các giao thức mạng TCP/IP, đều có chức năng kết nối các máy lại với nhau, và có thể gửi dữ liệu cho nhau....
### Khác nhau

các header của TCP và UDP khác nhau ở kích thước (20 và 8 byte) nguyên nhân chủ yếu là do TCP phải hộ trợ nhiều chức năng hữu ích hơn(như khả năng khôi phục lỗi). UDP dùng ít byte hơn cho phần header và yêu cầu xử lý từ host ít hơn

TCP :
- Dùng cho mạng WAN
- Không cho phép mất gói tin
- Đảm bảo việc truyền dữ liệu
- Tốc độ truyền thấp hơn UDP

UDP:
- Dùng cho mạng LAN
- Cho phép mất dữ liệu
- Không đảm bảo.
- Tốc độ truyền cao, VolP truyền tốt qua UDP
# kill -0
kill -0 <pid> just gives a return value 0 if the process exists, and 1 if it doesn't.

# Cách thêm tên người dùng và user vào file history
- Truy cập vào file bashrc
` sudo nano .bashrc `

- Kéo đến cuối add thêm cái 
` export HISTTIMEFORMAT="$USER %m/%d/%Y %H:%M " `

- Save lại về terminal chạy lệnh 
` source .bashrc`

- chạy thử `history` để xem sự thay đổi


# Ps
Lệnh này thường để xem tất cả những process đang chạy và các thông tin về nó
![image](https://user-images.githubusercontent.com/45547213/50621040-ee777400-0f35-11e9-8f8b-8038a6477ae0.png)

- PID Process ID
- A TTY(teletype terminals) là computer terminal. Trong ps, đó là cái terminal chạy cái command đó 
- STAT: chỉ trạng thái của process (dead sleeping zombie) và điều kiện memory(high, low priority)
- TIME: chạy được bao lâu r
- COMMAND: lệnh
## 1 vài câu lệnh cơ bản
- Display process by user
` ps -f -u www-data `
