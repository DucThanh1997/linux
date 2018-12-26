# Command Check System info

- Command `cat /etc/*release`: Lệnh này sẽ cho chúng ta thông tin về tên hệ điều hành,
phiên bản và distro đang dùng và một số các thông tin trợ giúp khác.

![image](https://user-images.githubusercontent.com/45547213/50432241-1138d580-0903-11e9-8a4d-51e961929a8e.png)

- Command `uname -a` dùng cho cả Ubuntu với CentOS: 
Lệnh này show ra đầy đủ các thông tin của kernel như phiên bản kernel là 4.4.0-087-aws, 32bit hay 64bit

![image](https://user-images.githubusercontent.com/45547213/50432293-5e1cac00-0903-11e9-9d81-0dc929031e25.png)

Có thể dùng các tùy chọn khác để show ra từng thông tin một
```
-a, --all                print all information, in the following order, except omit -p and -i if unknown:
-s, --kernel-name        print the kernel name
-n, --nodename           print the network node hostname
-r, --kernel-release     print the kernel release
-v, --kernel-version     print the kernel version
-m, --machine            print the machine hardware name
-p, --processor          print the processor type (non-portable)
-i, --hardware-platform  print the hardware platform (non-portable)
-o, --operating-system   print the operating system
    --help     display this help and exit
    --version  output version information and exit
```

- Command `cat /proc/version`: cũng kiểm tra thông tin kernel

![image](https://user-images.githubusercontent.com/45547213/50432335-b05dcd00-0903-11e9-8ff8-beea034f81f8.png)

- Command `lsb_release -a` kiểm tra phiên bản hệ điều hành distro của nó,

![image](https://user-images.githubusercontent.com/45547213/50432372-e307c580-0903-11e9-936c-df4853c87355.png)

- Command `sudo lspci` liệt kê các thiết bị PCI trong máy và Command 

- Command `sudo lsusb` liệt kê tất cả các thiết bị usb

![image](https://user-images.githubusercontent.com/45547213/50432408-28c48e00-0904-11e9-842c-d1441c6befd5.png)

Command `lscpu` hiển thị thông tin về cpu

Command `free -m` xem thông tin RAM và SWAP

Command `fdisk -l` xem các thông tin phân vùng ổ cứng

Command `df -h` hiển thị các thông về không gian sử dụng đĩa

Command `du -sh` xem dung lượng của thư mục hiện hành, du để xem dung lượng của tất cả các thư mục con bên trong




