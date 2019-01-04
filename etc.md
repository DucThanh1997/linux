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

  auto: đây không phải là 1 filesytem. Nó có nghĩa là hệ thống sẽ tự động nhận diện loại filesystem của thiết bị khi thiết bị đó được mount.
+ Cột 4: là các tùy chọn khi mount.
  - auto: tự động mount thiết bị khi máy tính khởi động.
  - noauto: không tự động mount, nếu muốn sử dụng thiết bị thì sau khi khởi động vào hệ thống bạn cần chạy lệnh mount.
  - user: cho phép người dùng thông thường được quyền mount.
  - nouser: chỉ có người dùng root mới có quyền mount.
  - exec: cho phép chạy các file nhị phân (binary) trên thiết bị.
  - noexec: không cho phép chạy các file binary trên thiết bị.
  - ro (read-only): chỉ cho phép quyền đọc trên thiết bị.
  - rw (read-write): cho phép quyền đọc/ghi trên thiết bị.
  - sync: thao tác nhập xuất (I/O) trên filesystem được đồng bộ hóa.
  - async: thao tác nhập xuất (I/O) trên filesystem diễn ra không đồng bộ.
  - defaults: tương đương với tập các tùy chọn rw, suid, dev, exec, auto, nouser, async

+ Cột 5 là tùy chọn cho chương trình dump, công cụ sao lưu filesystem. Điền 0: bỏ qua việc sao lưu, 1: thực hiện sao lưu.

+ Cột 6 là tùy chọn cho chương trình fsck, công cụ dò lỗi trên filesystem. Điền 0: bỏ qua việc kiểm tra, 1: thực hiện kiểm tra



# /etc/group
Group name, password, group ID, subgroup, danh sách account của group đều được ghi lại ở file này.
## Cấu trúc
` thanh_group:x:501:thanh_user3,thanh_user2 `
- thanh_group là user
- x là mật khẩu được mã hóa
- 501 là group id
- phần còn lại là tên user
các thành phần này được ngăn cách vs nhau bằng dấu : 

# /etc/hosts
có 2 loại /etc/hosts.allow là cho phép còn /etc/hosts.deny là không cho
ALL: 192.168.40.100

# /etc/inittab 
Khi bạn khởi động hệ thống hoặc thay đổi cấp độ chạy bằng lệnh init hoặc shutdown, init daemon sẽ bắt đầu các quy trình bằng cách đọc thông tin từ tệp / etc / inittab. Tệp này xác định ba mục quan trọng cho quy trình init:

Mức chạy mặc định của hệ thống

Những quá trình nào để bắt đầu, theo dõi và khởi động lại nếu chúng chấm dứt

Cần làm gì khi hệ thống bước vào cấp độ chạy mới
# /etc/passwd
File passwd (dạng plain-text) nằm ở thư mục /etc chứa danh sách các tài khoản trên hệ thống, cung cấp thông tin hữu ích về mỗi tài khoản như: User ID, Group ID, Home Directory, Shell…

## Cấu trúc
Username:Password:UID:GID:UIDInfo:HomeDirectory:Shell
1. Username: Tên người dùng, được sử dụng khi user đăng nhập, không nên chứa các ký tự in hoa trong username.

2. Password: Nếu sử dụng shadow password thì nên sử dụng dấu x hoặc ký tự * (gõ man pwcnv, và man shadow để hiểu rõ hơn)

3. User ID (UID): Đây là 1 chuỗi số duy nhất được gán cho user, hệ thống sử dụng UID hơn là username để nhận dạng user.

4. Group ID (GID): Là 1 chuỗi số duy nhất được gán cho Group đầu tiên mà user này tham gia (thông tin các Group có trong file /etc/group)

5. User ID Info (còn gọi là GECOS): Trường này không quan trọng lắm, bạn để trống cũng được vì chỉ dùng cho mục đích khai báo các thông tin cá nhân về user như: tên đầy đủ, số điện thoại… Lệnh finger sẽ cung cấp thêm những thông tin phụ này.

6. Home directory: Phải là đường dẫn đầy đủ tới thư mục sẽ làm thư mục chủ cho user, mặc định đây sẽ là thư mục hiện hành (working direcroty) khi user đăng nhập. Nếu bạn chỉ đến 1 thư mục không tồn tại thì hệ thống sẽ tự gán là thư mục gốc (/) làm thư mục chủ.

7. Shell: Đường dẫn đầy đủ tới login shell. Nếu để trống trường này thì login shell mặc định là file /bin/sh, nếu chỉ tới 1 file không tồn tại thì user không thể đăng nhập vào hệ thống từ giao diện console hoặc qua SSH bằng lệnh login. Nhưng user vẫn có thể đăng nhập thông qua giao diện đồ họa bằng cách sử dụng non-login shell.

