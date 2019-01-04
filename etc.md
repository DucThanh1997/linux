# etc/exports
## Định nghĩa:
NFS sử dụng tập tin /etc/exports để lưu danh sách tập tin hệ thống được chia sẻ và tên máy tính (hoặc địa chỉ IP tương ứng) được cấp quyền sử dụng. Khi thay đổi nội dung tập tin này, bạn cần quan tâm một số điểm sau:

## Cấu trúc

`</tên_thư_mục_chia_sẻ>         <Tên_máy_tính_hoặc_địa_chỉ_IP><(quyền hạn)>`

 

Trong đó các tham số được hiểu như sau:

Tên_thư_mục_chia_sẻ là tên thư mục cần chia sẻ cho máy trạm.

Tên_máy_tính_hoặc_địa_chỉ_IP là tên máy được chia sẻ hoặc địa chỉ IP tương ứng. Nếu bạn dùng địa chỉ IP thì có thể liệt kê nhiều máy theo địa chỉ mạng con.

Quyền hạn: các máy trạm có thể có các quyền hạn sau:

- rw: quyền đọc và viết.
- ro: quyền chỉ đọc.
- noaccess: cấm truy cập vào các thư mục cấp con của thư mục được chia sẻ.
- no_subtree_check: tùy chọn này ngăn cản việc kiểm tra cây con, đó là một quá trình mà host phải kiểm tra xem các tập tin thực sự vẫn có sẵn trong cây xuất cho mỗi yêu cầu.
- no_all_squash: Cho phép các quyền của user

Ví dụ: 

`/mnt/a 192.168.0.0/28(rw)`

# etc/fstab
## Định nghĩa
/etc/fstab chứa các thông tin cần thiết để xác định xem một phân vùng hay thiết bị của bạn được mount như thế nào
và mount vào đâu trong cấu trúc thư mục.
## Cấu trúc
thiết bị mount             nơi mount            kiểu dữ liệu           các tùy chọn của việc mount          tùy chọn của lệnh dump         tùy chọn của lệnh fsdk

Ví dụ

+ Cột 1: đường dẫn tới file hoặc thiết bị để mount 

+ Cột 2: đường dẫn của mount point, là một thư mục trống được tạo sẵn trong cây thư mục. Khi gõ lệnh mount, nếu bạn không chỉ định rõ mount point thì đây là mount point mặc định cho thiết bị ở cột 1. Thư mục chứa mount point thường là /mnt hay /media , mặc dù bạn có thể mount thiết bị vào bất cứ thư mục trống nào.

+ Cột 3: là kiểu filesystem của thiết bị. Linux hỗ trợ nhiều kiểu filesystem, dưới đây là 1 số filesystem phổ biến:

Ext2 và Ext3: điểm khác biệt lớn nhất giữa 2 loại filesystem này là ext3 hỗ trợ tính năng journaling, tức là khi bạn tắt máy không đúng cách (do cúp điện đột ngột, hệ thống bị treo nên phải nhấn nút khởi động lại…) thì khả năng mất mát dữ liệu ở mức thấp, đồng thời hệ điều hành sẽ không phải tốn thời gian để kiểm tra, tìm lỗi trên filesystem trong lần khởi động kế tiếp.
ReiserFS: cũng hỗ trợ tính năng journaling nhưng có thêm nhiều tính năng nổi trội hơn so với ext3. Ngày nay ext3, ReiserFS được chọn là filesystem mặc định trên nhiều bản phân phối Linux.
swap: phân vùng làm không gian bộ nhớ ảo, dùng để bổ sung thêm bộ nhớ cho hệ thống khi hệ điều hành phát hiện việc thiếu hụt bộ nhớ RAM.
Vfat (FAT16, FAT32) và NTFS: đây là các filesystem được Windows hỗ trợ.
nfs: dành cho các tài nguyên ở xa, được chia sẻ qua mạng sử dụng NFS
auto: đây không phải là 1 filesytem. Nó có nghĩa là hệ thống sẽ tự động nhận diện loại filesystem của thiết bị khi thiết bị đó được mount.
+ Cột 4: là các tùy chọn khi mount.
