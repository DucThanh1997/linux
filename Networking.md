# Network interface

## Định nghĩa: 
Một kênh kết nối giữa thiết bị và mạng. 

Về mặt vật lý, network interface được thể hiện là card mạng (viết tắt là NIC). 
Một hệ thống có thể có nhiều card mạng hoạt động.
Các card mạng thể sử dụng hoặc ngắt bất cứ lúc nào. 

Các card mạng đang hoạt động trong hệ thống được liệt kê chi tiết bằng lệnh `ifconfig`. 
Các file cấu hình rất quan trọng trong việc đảm bảo card hoạt động chính xác.

Cấu hình card mạng thì dùng lệnh này: `sudo nano /etc/network/interfaces`
![image](https://user-images.githubusercontent.com/45547213/50438945-bb742580-0922-11e9-8dff-87f32f781d13.png)

# Route table
Lệnh route được sử dụng để xem hoặc chỉnh sửa bảng định tuyến IP. Chỉnh sửa IP để thêm, xóa hoặc thay đổi. Ví dụ
![image](https://user-images.githubusercontent.com/45547213/50439666-743b6400-0925-11e9-9c7f-60b7e12108ab.png)

