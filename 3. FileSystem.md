# FileSystem
- `/root` : chỉ có root user mới có quyền ghi trong thư mục này. chú ý `/root` là thư mục home của root user chứ không phải là /.

- `/bin` : chứa các chương trình thực thi. các chương trình chung được sử dụng bởi tất cả mọi người như lệnh như ls, grep, netstat...

- `/sbin` : chứa các chương trình thực thi như lệnh như Iptable, reboot, ifconfig... ==> các lệnh cho sysadmin 

- `/etc` : chứa các file config, chứa các shell script dùng để khởi động hoặc tắt các chương trình khác 

- `/dev` : chứa các file thiết bị của hệ thống như usb, disk, ...

- `/proc` : chứa thông tin các process

- `/var` : chứa thông tin các biến, log, mail,... 

Ví dụ:: 
```
 system log files:/var/log 
 packages files: /var/lib
 print queues: /var/spool
 temp files: /var/tmp 
 ftp home directory: /var/ftp
 web server directory: /var/www   
```

- `/usr` : chứa các thư viện, file thực thi... 
trong đó:
    - `/usr/bin` chứa các file thực thi của người dùng như: at, awk, cc, less...
      Nếu bạn không tìm thấy chúng trong `/bin` hãy tìm trong `/usr/sbin`

    - `/usr/sbin` chứa các file thực thi của hệ thống dưới quyền của admin như: atd, cron, sshd... 
       Nếu bạn không tìm thấy chúng trong `/sbin` thì hãy tìm trong thư mục `usr/lib`. 

    - `/usr/lib` chứa các thư viện cho các chương trình trong `/usr/bin` và `/usr/sbin` 

    - `/usr/local` chứa các chương tình của người dùng được cài từ mã nguồn.

     Ví dụ như bạn cài apache từ mã nguồn, nó sẽ được lưu dưới `/usr/local/apache2` `/usr/include` 
các header files dùng để biên soạn các ứng dụng `/usr/share` chứa các dữ liệu được chia sẻ và sử dụng bởi các ứng dụng,
thường là các ứng dụng cấu trúc không phụ thuộc `/usr/src` mã nguồn,
thường sử dụng cho Linux kernel `/usr/local` dữ liệu và chương trình cụ thể cho các máy nội vùng

`/home` : thư mục chứa tất cả các file cá nhân của người dùng

`boot` : chứa các file yêu cầu khi khởi động như initrd, vmlinux, grub... 
Với mọi kernel được cài đặt trên hệ thống sẽ có 4 file quan trọng vmlinuz là nhân linux đã được nén, sử dụng cho việc khởi động initramfs là file hệ thống dữ liệu ram đầu vào, sử dụng cho việc khởi động config.is là file cấu hình nhân, sử dụng để gỡ lỗi system.map chứa các kí hiệu bảng của kernel, sử dụng để gỡ lỗi mỗi file này có một phiên bản kernel được nối vào tên của nó


`/lib` : chứa các thư viện hỗ trợ các file thực thi trong /bin và /sbin

`/opt` : chứa các ứng dụng thêm vào từ các nhà cung cấp độc lập khác

`/mnt` : là thư mục tạm để mount các file hệ thống

`/media` : chứa các thiết bị như CdRom `/media/cdrom` hay các phân vùng đĩa cứng `/media/Data`
                         
# các định dạng filesystem (ext2, ext3, ext4)
Các định dạng filesystem mà linux supports:

ext3, ext4, btrfs, xfs (native Linux filesystems)

vfat, ntfs, hfs (filesystems from other operating systems)

Mỗi hệ thống tiệp tin nằm trên một partition của đĩa cứng. Partitions giúp tổ chức nội dung của ổ đĩa theo các loại data nó chứa và cách nó sử dụng. Ví dụ, các chương trình quan trọng cần thiết để chạy hệ thống thường được lưu trữ trên một partition riêng biệt hơn là chứa các file của người dùng thông thường. Ngoài ra các file tạm thời được tạo và hủy trong quá trình hoạt động bình thường của linux thường nằm trên một partition riêng; theo cách này, việc sử dụng tất cả các không gian có sẵn trên một patition cụ thể có thể không ảnh hưởng đến hoạt động bình thường của hệ thống.

Trước khi bạn có thể bắt đầu sử dụng filesystem, bạn cần mount nó lên filesystem tree tại mountpoint. Đây đơn giản là một thư mục (có thể để trống hoặc không) nơi các hệ thống tệp tin được gắn vào (mounted). Đôi khi bạn cần tạo một directory nếu nó không tồn tại. Nếu bạn mount một filesystem trên một directory không rỗng thì các nội dung trước đó sẽ được che đi và không thể truy cập cho đến khi filesystem unmounted. Vì vậy các mount point thường là các directory rỗng.

Khi cài đặt cần tạo ra ít nhất 2 phân vùng, một để mount root cho \, một cho swap.

Bạn có thể mount tự động thông qua file /etc/fstab, kernel sẽ đọc thông tin ở đây khi nó khởi động. Nếu sửa nội dung file này thì cần mount lại:

  $ sudo mount -a

Mount bằng tay: sử dụng câu lệnh mount, ví dụ gắn thư mục windows: Nếu ổ C: định dạng ntfs cài windows có tên /dev/sda1 muốn mount vào hệ thông linux để sử dụng thì đầu tiên cần tạo một thư mục để gắn nó, rồi sau đó mount:

	$ mkdir /mnt/Windows
	$ mount -v -t ntfs /dev/sda1 /mnt/Windows
Lúc này /dev/sda1 là đường dẫn cần mount, /mnt/Windowns là mountpoint, từ giờ có thể truy cập đến ổ C qua /mnt/Windows

Nếu không muốn dùng nữa thì unmount đi

	$ sudo umount /mnt/WindowsXP 
	hoặc
	$ sudo umount /dev/sda1
Lưu ý: một số điểm cần lưu ý khi mount:

Các thiết bị không có mặt trong file `/etc/fstab` thì chỉ có root mới có thể mount được
Người dùng bình thường chỉ có thể mount được những thiết bị có trong file `/etc/fstab` thôi










                         
