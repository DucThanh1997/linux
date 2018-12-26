# Network Filesystem
## Định nghĩa
NFS (the Network File System) là một giao thức được dùng cho việc chia sẻ data qua physical systems. Người quản trị gắn các thư mục của người dùng từ xa trên một máy chủ để cho phép họ truy cập vào cùng một tệp và cấu hình.

Hoạt động theo cơ chế client-server

Hiện tại NFS có 4 phiên bản. NFSv4 là phiên bản đang được sử dụng nhiều nhất và hỗ trợ phát huy tối đa của giao thức NFS

Một số vấn đề với NFS
   
    - Không bảo mật, mã hóa dữ liệu
    - Hiệu suất hoạt động trung bình ở mức khá, nhưng không ổn định
    - Dữ liệu phân tán có thể bị phá vỡ nếu có nhiều phiên sử dụng đồng thời

File /etc/export chứa các đường dẫn thư mục và quyền hạn mà một host muốn chia sẻ dữ liệu với host khác qua NSF.

Các máy chủ có quyền hạn sau:
   
    - `rw`: Đọc và ghi
    - `ro`: Chỉ được đọc
    - `noacess`: Cấm truy cập vào các thư mục con của thư mục đc chia sẻ
   
## Lab
 - B1: tải kernel-server về `sudo apt-get install nfs-kernel-server` cho cả client và server
 - B2: start service đó: `service nfs-kernel-server start` cho cả client và server
 - B3: tạo thư mục để share `sudo mkdir /mnt/share` trên server
 - B4: edit file /etc/exports bằng lệnh: `sudo nano /etc/exports` và thêm dòng lệnh `mnt/share1  192.168.0.136 (rw,sync,no_root_squash,no_subtree_check,no_all_squash)`
 - B6: tắt firewall trên server: `sudo ufw disable`
 - B5: restart lại kernel-server: `sudo systemctl restart nfs-kernel-server`
 - B6: thoát khỏi server và tạo file trên client: `mkdir share1`
 - B7: tắt firewall trên server: `sudo ufw disable`
 - B8: mount file: `sudo mount 192.168.100.23:/mnt/share1 /share1`
