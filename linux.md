# Khám phá filesystem
Command tree là cách hay để có thể nhìn toàn cảnh về cây thư mục của hệ thống. Một số các command hữu ích sau:
Command
Result
ls
Liệt kê nội dung của thư mục đang hiện tại làm việc
ls -a
Liệt kê thêm các file ẩn
ls -la
Hiển thị thêm các thông tin chi tiết của file và thư mục
tree
Hiển thị cây thư mục của toàn bộ hệ thống filesystem
tree -d
Chỉ hiện thị cây các thư mục mà bỏ qua danh sách các file

tìm đường dẫn của chương trình: which mysql nếu không tìm thấy thì dùng whereis 

# hardlink và soflink
hardlink: 2 file hardlink với nhau thì khi file này thay đổi thì file kia cũng thay đổi nhưng khi xóa file này thì file kia không bị xóa
cú pháp để tạo: ln file1.txt file2.txt

softlink: giống như cái kia nhưng xóa cái file gốc kia thì file còn lại không truy cập được nữa
cú pháp để tạo: ln -s file1.txt file4.txt

# The File Stream
Khi các dòng lệnh được thực thi, mặc định sẽ có 3 luồng fidinle chuẩn:
            ▪ standard input or stdin
            ▪ standard output or stdout
            ▪ standard error or stderr

Stdin: 
Đây là nơi mà dữ liệu được nhập vào, và thường là thiết bị cuối (terminal). Để tìm ra thiết bị nào là terminal, hãy xem lệnh "man 1 tty".
Bạn có thể tạo ra một tệp tin chứa các lệnh, và chuyển nó cho lệnh.
Stout: 
Đây là nơi chương trình xuất dữ liệu ra. Nó cũng thương là thiết bị cuối (terminal), nhưng bạn có thể chuyển hướng nó.
Bạn chuyển hướng nó bằng dấu ">".
Ví dụ bạn muốn lệnh "echo" kết xuất dữ liệu ra một tệp tin, thế thì làm như sau:
$echo "Hello" > hello.txt 
Ghi vào file hello chữ hello 

Stderr: 
Là nơi các chương trình báo lỗi, cũng giống như ở trên, nó thường là thiết bị cuối (terminal), và cũng có thể chuyển hướng. 

File descriptors trong Linux có các quy ước: 0 là stdin, 1 là stdout, 2 là stderr.

# Search for file
Dùng locate để tìm kiếm file:
    1. sudo apt-get install -y mlocate  (tải tiện ích locate)
    2. sudo updatedb (update database)
    3. sudo locate zip (tìm những file có đuôi zip)

Hoặc dùng Find
	find /path <đuôi file>
	find home/thanh IMG_1550.mp4           (tìm  file  IMG_1550.mp4 có trong thư mục thanh)
	Thêm tùy chọn -type d để chỉ tìm các thư mục hoặc -type f để chỉ tìm các file và -type l là symbolic links có tên haha


# Manage files
	Tạo file: mkdir <tên file>
	Xóa file: rmdir <tên file>

Command
Usage
cat
Sử dụng để xem các file không quá dài
tac
Sử dụng để xem các file từ cuối lên, bắt đầu là dòng cuối cùng
less
Sử dụng để xem các chương trình lớn hơn vì nó cho phép phân trang
tail
Mặc định sẽ show ra 10 dòng, nếu muốn xem nhiều hơn thêm tùy chọn n 15
head
Ngược lại với tail, show ra 10 dòng đầu tiên của file
file word thôi 







# Nén file và giải nén file bằng tar
## Nén file:
tar -czvf name-of-archive.tar.gz /path/to/directory-or-file

c: Create an achieve
z: zip lại
v: display quá trình nén
f: cho phép bạn đặt tên
name-of-archive.tar.gz: tên của file zip
/path/to/directory-or-file: đường dẫn đến file đó



tar -czvf Desktop.tar Desktop

## Giải nén file
tar -xzvf Desktop.tar	

# Filesystem Structure
	Trên nhiều hệ điều hành, bao gồm cả linux, filesystem có cấu trúc giống như cây. Cây thường được miêu tả ngược, thường bắt đầu thừ thư mục root (/) tất cả các thứ mục khác sẽ là con của thư mục này.
	Mỗi hệ thống tiệp tin nằm trên một partition của đĩa cứng. Partitions giúp tổ chức nội dung của ổ đĩa theo các loại data nó chứa và cách nó sử dụng. Ví dụ, các chương trình quan trọng cần thiết để chạy hệ thống thường được lưu trữ trên một partition riêng biệt hơn là chứa các file của người dùng thông thường. Ngoài ra các file tạm thời được tạo và hủy trong quá trình hoạt động bình thường của linux thường nằm trên một partition riêng; theo cách này, việc sử dụng tất cả các không gian có sẵn trên một patition cụ thể có thể không ảnh hưởng đến hoạt động bình thường của hệ thống.
	Lệnh mount phục vụ để gắn hệ thống tệp được tìm thấy trên một số thiết bị vào cây tệp lớn. Ngược lại, lệnh umount (8) sẽ tách nó ra một lần nữa.
	sudo mount -a để m

# Tạo Ram ảo
Swap là phương thức để tạo ram và swap có 2 tiện ích chính:
    • Khi hệ thống cần nhiều RAM hơn so với các memory có sẵn thì kernel sẽ di chuyển các page ít được sử dụng và swap space, lấy đi bộ nhớ đã được giải phóng để cấp thêm cho tiến trình đang chạy.
    • Một số lượng đáng kể các page được các application sử dụng trong quá trình khởi động sau đó sẽ không bao giờ sử dụng nữa
Command: swapon -s xem số ram ảo có trong máy
		 sudo dd if=/dev/sda2 of=/var/swapfile bs=1M count=4194304
		 tạo ram ảo
# The home directories
Trong bất kỳ một hệ thống UNIX nào, mỗi user đều có một thư mục home và thường được đặt ở /home. Với user root thì thư mục home sẽ nằm ở /root
The device directory
/dev thư mục bao gồm các device note, một kiểu của pseudo-file được sử dụng bới hầu hết các hardware và software device, ngoại trừ các network devices.

# File Permissons
Trong Linux và Unix, mỗi file đều có một user sở hữu gọi là owner. Mỗi file cũng sẽ có một group sở hữu, những người trong group này có các permission nhất định: read, write và execute.

chown
Thay đổi người sở hữu file và thư mục
chgrp
Thay đổi group sở hữu
chmod
Thay đổi permission trên file hoặc thư mục


Files có 3 kiểu permission: read (r), write (w), execute (x). Chúng thường được biểu diễn theo thứ tự rwx. Các permission này ảnh hưởng tới các nhóm của người sở hữu: user(u), group (g), và others (o). Kết quả là bạn có 3 nhóm như sau:
rwx:
rwx
rwx
u:
g:
o


Lệnh chmod
chmod [option] [permission] [name file/directory]

Phần permision có 3 kiểu:

    • Kiểu ký tự (rw-rw-r--)
    • Kiểu ugo: Phân quyền cho từng đối tượng (u+x: user thêm quyền thực thi)
    • Kiểu số: ví dụ rwxrw-r = 764
Một số quy ước cho kiểu ugo

Operator

+ "+" Thêm quyền
- "-" Bỏ quyền
+ "=" Gán quyền Owner


+ a: u+g+o
+ u: user owner
+ g: group owner
+ o: other user

trừ tất cả các quyền của mọi người, thêm quyền đọc viết xử lí cho group và user, xóa quyền viết của user ở file t

Kiểu dùng ký tự để phân quyền
Permission
Name
Note
r: read owner có quyền đọc file

w: write owner có quyền sửa và xóa file

x: execute owner có quyền thực thi đối với file, với thư mục thì được phép sử dụng lệnh cd để truy cập

s: setuid hoặc setgid  Tất cả các file và thư mục con sẽ được kế thừa group owner

t: sticky bit Chỉ có owners mới có thể rename và xóa file trong tất cả các file của directory

"-" Không set quyền



Một ví dụ:

chmod u+rwx thanh.txt                      gán quyền cho user

sudo chown root thanh.txt                  thay đổi chủ sở hữu


Linux swap memory

Swap(hoán đổi) là một vùng trên ổ đĩa mà nó có thể được sử dụng để lưu trữ các dữ liệu mà không được sử dụng trên bộ nhớ vật lý (RAM). Đây là nơi tạm thời chứa các tài nguyên đang không hoạt động trong bộ nhớ.

Swap được sử dụng khi hệ thống của bạn quyết định rằng nó cần thêm bộ nhớ RAM cho quá trình hoạt động và bộ nhớ RAM không còn dư để sử dụng.Nếu điều đó xãy ra, các tài nguyên và dữ liệu tạm thời không hoạt động trên bộ nhớ RAM sẽ được di chuyển để lưu trữ vào không gian Swap để giải phóng bộ nhớ RAM và sử dụng cho việc khác.

Lưu ý rằng thời gian truy cập vào vùng Swap là chậm hơn rất nhiều, do đó bạn không nên coi việc sử dụng Swap là một phương pháp thay thế hoàn hảo cho bộ nhớ vật lý (RAM). Swap có thể là một phân vùng dành riêng cho Swap (khuyến nghị), một tập tin Swap hoặc một sự kết hợp của phân vùng và tập tin Swap.

Có hai phương pháp swap space:

    • Swap partition: là một phân vùng độc lập dành cho việc swap và không dữ liệu nào được lưu ở đó.
    • Swap file: là một file đặc biệt được lưu trong filesystem ở một vị trí tạm thời trên disk, nó sẽ lưu thông tin và các file mà RAM không sử dụng để giải phóng RAM



User and Groups

	Who: list ra các user hiện tại đang đăng nhập. 

	Whoami: để xác định mình đang dùng user nào thì dùng lệnh 

	adduser <tên user>: tạo user mới

	deluser <tên user>: xóa user

	groupadd <tên group>: thêm gr
	
Root User

	Root là tài khoản có toàn quyền trên hệ thống. Các hệ thống khác thường gọi là administrator account; Linux thường gọi là superuser account. Phải thật cẩn thận khi cấp quyền truy cập root cho các user. Sử dụng su để chuyển đổi giữa các user.

Command History: các câu lệnh ở terminal đều được lưu ở history để show ra hết
# Linux processes
Một processes đơn giản là một thể hiện của một hay nhiều luồng (threads) thực hiện trên cùng một máy.

Hệ điều hành sẽ theo dõi các tiến trình thông qua một ID có 5 chứ số mà được biết như là pid hay process ID. Mỗi tiến trình có duy nhất một pid.

Tại cùng một lúc không thể có 2 tiến trình có cùng pid.

Khi bạn bắt đầu một tiến trình (đơn giản là chạy một lệnh), có 2 các để chạy nó:

    • Foreground Process: Mặc định khi bắt đầu các tiến trình là Foreground, nhận input từ bàn phím và output tới màn hình. Trong khi chương trình chạy thì không thể chạy bất cứ tiến trình nào khác
    • Background Process: chạy mà không kết nối với bàn phím của bạn. Lợi thế là khi đó đang chạy tiến trình background vẫn có thể chạy các tiến trình khác.

Để bắt đầu một tiến trình Background thì thêm dấu & vào cuối câu lệnh ví dụ

$ ls &
ở đây lệnh ls muốn có một đầu vào, nó tiến vào trạng thái dừng tới khi bạn chuyển nó vào trong foreground.

Ps: Liệt kê các tiến trình đang chạy

kill <pid> hoặc killall <pname>

top: giống như bật task manager trong 

renice

Câu lệnh renice được dùng để thay đổi giá trị ưu tiên của tiến trình. Mặc định giá trị ưu tiên là 0, giá trị -19 được ưu tiên rất cao, ngược lại 19 lại có độ ưu tiên thấp nhất.

Câu lệnh renice yêu cầu cung cấp PID của tiến trình. Lệnh sau đây sẽ thay đổi priority của tiến trình xuống mức thấp nhất

# Logical Volume Manager

##Khái niệm:
LVM (Logical Volume Manager) là một kỹ thuật cho phép tạo ra các không gian ổ đĩa ảo từ ổ đĩa cứng để có thể thay đổi kích thước dễ dàng hơn

## Vai trò:
LVM giúp nới rộng hoặc thu hẹp không gian ổ đĩa mà không cần phải chia lại partition trên đĩa cứng, không ảnh hưởng đến hệ thống và các dịch vụ đang chạy.

LVM có thể gom nhiều ổ đĩa cứng thành một ổ ảo, giúp tăng kích thước lưu trữ.

##Các thành phần:
Bố cục cơ bản Logical Volume Manager layout (LVM) trông giống như sau:

    • Physical Volume(s): Là những ổ cứng vật lý hoặc các partition trên nó như: /dev/sdb1, /dev/sdc1, /dev/sdd1, /dev/sdc1
    • Volume Group(s): Có thể coi đây là ổ đĩa ảo, bao gồm nhiều các Physical Volume: fileserver
    • Logical Volume(s): Có thể coi đây là các phân vùng ảo trên ổ đĩa ảo, có thể thay đổi kích thước tùy ý: /dev/fileserver/share, /dev/fileserver/backup, /dev/fileserver/media
## Cấu trúc: 

Partitions:

là các phân vùng của Hard drives, mỗi Hard drives có 4 partition, trong đó partition bao gồm 2 loại là primary partition và extended partition

    • Primary partition: là phân vùng chính, có thể khởi động, mỗi đĩa cứng có thể có tối đa 4 phân vùng này
    • Extended partition: Phân vùng mở rộng, có thể tạo ra những vùng luân lý

Physical Volume: Là một cách gọi khác của partition trong kỹ thuật LVM, nó là những thành phần cơ bản được sử dụng bởi LVM. Một Physical Volume không thể mở rộng ra ngoài phạm vi một ổ đĩa.

Logical Volume Group: Là tập hợp của nhiều Physical Volume trên những ổ đĩa khác nhau kết hợp l. Với LVM Logical Volume Group được xem như một ổ đĩa ảo.

Logical Volumes: Logical Volume Group được chia nhỏ thành nhiều Logical Volume, mỗi Logiạical Volume có ý nghĩa tương tự như partition. Nó được dùng cho các mount point và được format với những định dạng khác nhau như ext2, ext3 … Khi dung lượng của Logical Volume được sử dụng hết ta có thể đưa thêm ổ đĩa mới bổ sung cho Logical Volume Group và do đó tăng được dung lượng của Logical Volume.

Physical Extent: là một đại lượng thể hiện một khối dữ liệu dùng làm đơn vị tính dung lượng của Logical Volume

## Cơ chế hoạt động:
từ 1 hoặc nhiều physical volume có thể gom lại thành 1 hoặc nhiều Logical Volume Group, từ các Logical Volume Group này có thể chia thành nhiều Logical Volume khác. 

Các logical volume có dung lượng tùy ý nhưng không thể vượt quá dung lượng của physical volumes

LVM giúp bạn phân bổ không gian ổ đĩa hợp lý hơn, khi có bất kỳ phân vùng nào không dùng đến thì có thể dễ dàng ghép nó vào phân vùng đang cần mở rộng. Bạn có thể thay đổi kích thước bất cứ khi nào bạn cần.

## LVM Migrating
   
    • LVM là một tính năng của LVM cho phép tạo ra một bản sao dữ liệu từ một Logical Volume này đến một ổ đĩa mới mà không làm mất dữ liệu hay xảy ra tình trạng downtime.
    • User case: Khi có một ổ cứng cũ bị lỗi, bạn muốn thêm một ổ cứng mới gắn vào và di chuyển dữ liệu trên ổ cũ sang ổ này thì migrating là một lựa chọn tốt của LVM.

## LVM Snapshot
### Snapshot LVM là gì:
Snapshot là một tính năng của LVM cho phép tạo một bản sao lưu của thời điểm hiện tại để backup cho sau này, ta có thể khôi phục lại thời điểm đã backup trước đó nếu cần.

## Thin Provisioning trong LVM

Thin Provisioning là một tính năng nữa của LVM, nó cho phép tạo ra những ổ đĩa ảo từ storage pool giúp tận dụng tối đa tài nguyên của ổ đĩa.

Ví dụ một storage pool có dung lượng là 15GB, cấp cho 3 người, mỗi người 5GB, tổng tất cả mới sử dụng hết 6GB, nếu có thêm một user nữa thì sẽ không thể cấp phát mặc dù còn rất nhiều dung lượng trống (Thick volume). Để giải quyết vấn đề đó, ta có thể sử dụng Thin Provisioning. Khi đó bạn có thể cấp phát thêm cho user thứ 4 5GB để sử dụng. Cái này có nghĩa là dùng bao nhiêu cấp bấy nhiêu sẽ đỡ lãng phí tài nguyên hơn.

# Network interfaces
Networking interfaces là kênh kết nối giữa device và network. Về mặt vật lý, network interface chính là network interface card (NIC). Một hệ thống có thể có nhiều card mạng cùng hoạt động. Các card mạng có thể được lắp vào hoặc ngắt ra bất cứ lúc nào.

Để kiểm tra các card mạng đang hoạt động dùng `lệnh ifconfig`

Cấu hình đặt ip tĩnh trong Ubuntu: sửa file `cat /etc/network/interfaces` như sau:

auto eth0

iface eth0 inet static

address 10.0.0.41

netmask 255.255.255.0

network 10.0.0.0

broadcast 10.0.0.255

gateway 10.0.0.1

dns-nameservers 10.0.0.1 8.8.8.8

dns-domain acme.com

dns-search acme.com

Muốn để nhận ip từ dhcp server thì cấu hình như sau:

auto eth0

iface eth0 inet dhc


Lệnh route được sử dụng để xem hoặc chỉnh sửa bằng định tuyến IP, thêm, xóa hoặc thay đổi IP.

route add 192.168.0.110  gw 192.168.0.1

route delete 192.168.0.110  gw 192.168.0.1

route add -net 192.168.0.0 netmask 255.255.255.0 gw 192.168.60.0 ens33

route delete -net 192.168.0.0 netmask 255.255.255.0 gw 192.168.60.0 ens33


# Network Filesystem
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

## Cài đặt trên Ubuntu
### Cài đặt nfs trên server và client:

`sudo apt-get install nfs-kernel-server`
Khởi động nfs trên server và client:

`service nfs-kernel-server start`
Trên máy chủ, tôi sẽ tạo ra một thư mục để share các tệp tin và thay đôi quyền sở hữu tệp tin thành không sở hưu bởi ai cả:

`sudo mkdir /var/nfs/general -p
sudo chown nobody:nogroup /var/nfs/general`
Sửa nội dung file `/etc/exports` để share cả thư mục vừa tạo và thư mục /home

$ `sudo nano /etc/exports`
`/var/nfs/general 192.168.60.130(rw,sync,no_subtree_check)
/home 192.168.60.130(rw,sync,no_root_squash,no_subtree_check,no_all_squash)` 
Trong đó:

`rw`: Tùy chọn này cho phép máy tính client truy cập cả đọc và viết vào bộ đĩa (volume).

`sync`: Tùy chọn này bắt buộc NFS phải ghi các thay đổi vào đĩa trước khi trả lời. Điều này dẫn đến một môi trường ổn định và phù hợp hơn kể từ khi trả lời phản ánh tình trạng thực tế của bộ đĩa (volume) từ xa. Tuy nhiên, nó cũng làm giảm tốc độ của hoạt động tập tin.

`no_subtree_check`: tùy chọn này ngăn cản việc kiểm tra cây con, đó là một quá trình mà host phải kiểm tra xem các tập tin thực sự vẫn có sẵn trong cây xuất cho mỗi yêu cầu.

`no_root_squash`: Theo mặc định, NFS chuyển yêu cầu từ người dùng root từ xa vào một người dùng không có đặc quyền trên máy chủ. Điều này đã được dự định như là tính năng bảo mật để ngăn chặn một tài khoản root trên máy khách (client) sử dụng hệ thống tập tin của máy chủ như là root.

`no_all_squash`: enables the user’s authority

Sau đó khởi động lại server:

`sudo systemctl restart nfs-kernel-server`

Nếu firewall trên server đang bật (check status) thì cần điều chỉnh lại để mở cổng 2049, dùng lệnh sau để thêm rule:

`sudo ufw allow from 192.168.60.130 to any port nfs
sudo ufw status`

Trên client:

`sudo mkdir -p /nfs/general
sudo mkdir -p /nfs/home` 

mount các thư mục vào client:

`sudo mount 192.168.60.134:/var/nfs/general /nfs/general
sudo mount 192.168.60.134:/home /nfs/home`	

Kiểm tra xem đã mount được chưa bằng lệnh df -h. Giờ hãy thử tạo một file mới trong thư mục general trong client hoặc server ta sẽ thấy nó trên máy còn lại.

Gắn thư mục NFS trên client lúc khởi động bằng cách thêm chúng vào tệp tin /etc/fstab dòng sau:

`192.168.60.134:/var/nfs/general /nfs/general nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
192.168.60.134:/home /nfs/home nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0`

Nếu không dùng nữa thì trên client unmount thư mục share đó đi.


