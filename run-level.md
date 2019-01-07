# Kernel:
Là nhân linux và là chương trình kết nối giữa phần cứng và các ứng dụng chạy trên máy tính

# Init:
## Định nghĩa: 
tên chung ám chỉ chương trình được Kernel chạy đầu tiên khi khởi động máy tính

init là cha của các process

init có nhiều chế độ khác nhau mỗi chế độ có 1 đặc điểm riêng. Có tổng 7 chế độ, gọi là các runlevel
và các runlevel khi chạy sẽ làm gì làm như thế nào ở trong file cấu hình /etc/inittab

# Run-level
## Định nghĩa
runlevel là một chế độ hoạt động được cài đặt sẵn trên một hệ điều hành

có 7 level

– Run level 0 (init 0) System halt: chế độ tắt máy.

– Run level 1 (init 1) Single user: chế độ này chỉ sử dụng được 1 người dùng.

– Run level 2 (init 2) Multiple users, no NFS: chế độ đa người dùng nhưng không có dịch vụ NFS.

– Run level 3 (linit 3) Multiple users, command line : chế độ đa người dùng, có đầy đủ các dịch vụ.

– Run level 4 (linit 4) User-definable : cái này là do nghời dùng tự thiết lập

– Run level 5 (linit 5)  GUI (graphical user interface): giống cái số 3 nhưng xịn xò hơn, dễ sử dụng hơn (dùng cho bản ubuntu-Desktop)2

– Run level 6 (linit 6) Reboot: khởi động lại máy.

# chỗ cấu hình

Run level mặc định trong Redhat và Debian được định nghĩa trong file /etc/inittab. Ví dụ trong Redhat:

#System initialization.

si::sysinit:/etc/rc.d/rc.sysinit

l0:0:wait:/etc/rc.d/rc 0

l1:1:wait:/etc/rc.d/rc 1

l2:2:wait:/etc/rc.d/rc 2

l3:3:wait:/etc/rc.d/rc 3

l4:4:wait:/etc/rc.d/rc 4

l5:5:wait:/etc/rc.d/rc 5

l6:6:wait:/etc/rc.d/rc 6
#Trap CTRL-ALT-DELETE

ca::ctrlaltdel:/sbin/shutdown -t3 -r now

Giải thích:

`l4:4:wait:/etc/rc.d/rc 4`
khi hệ thống khởi động với runlevel là 4 thì init sẽ chạy các process hay file bash mặc định có trong file cấu hình /etc/rc.d/rc
 Các dòng cấu hình luôn gồm 4 trường cách nhau bởi dấu hai chấm (:)
- Trường đầu tiên (ví dụ: id, si, l0, ca, pf, pr) là tên gọi cho dòng đó. Tên gọi không quan trọng nhưng cần khác nhau cho mỗi dòng.

- Trường thứ hai (ví dụ: 3, 1, 2345 hoặc để trống) là run level mà dòng cấu hình này áp dụng cho. Nếu trường là 2345 thì dòng áp dụng cho 4 run level là 2, 3, 4, 5; nếu để trống thì áp dụng cho tất cả các level.

- Trường thứ ba (ví dụ: initdefault, sysint, wait, ctrlaltdel, powerfail, respawn) là chỉ dẫn cho init thực hiện các lệnh
  khi nó ở trong run level ở trường thứ hai.
  - boot: Chạy khi khởi động hệ thống. Với kiểu chạy này, tiến trình sẽ được thực thi với mọi cấp chạy.
  - initdefault: Quy định cấp chạy mặc định. ở tập tin trên thì cấp chạy măc định là 3.
  - respawn: Tiến trình trên dòng này sẽ được khởi động lại nếu nó bị lỗi khi đang chạy.
    Ví dụ như ở trên, trình getty sẽ được khởi tạo với kiểu chạy respawn.
    Trong trường hợp mật khẩu và tên người dùng nhập vào không hợp lệ thì getty sẽ lại được khởi động để người dùng nhập lại
    tên người dùng và mật khẩu.
  - wait : Khởi động tiến trình và chờ cho đến khi tiến trình kết thúc mới thực hiện tiếp các công việc khác.
  - sysinit: Chạy lúc khởi động với mọi cấp chạy và được chạy đầu tiên.
  - once: Tiến trình trên dòng này sẽ chỉ được thực hiện một lần.hực hiên với mọi cấp chạy.
  - ctrlaltdel: Chạy khi phím Ctrl+Alt+Del được nhấn.
  - bootwait: Khi khởi động, init sẽ thực hiện tiến trình trên dòng này và đợi cho đến khi nó kết thúc.
    Ngoài ra còn một số kiểu chạy nữa như ondermand, powerokwait...
    
- Trường thứ tư (ví dụ: /etc/rc.d/rc 0, /sbin/mingetty tty1) là lệnh hoặc script mà init cần thực thi.
  Trong ví dụ thì 0 và tty1 là đối số truyền vào cho script rc và lệnh mingetty.
