# iSCSI

## Khái niệm

iSCSI (internet Small Computer System Interface) là một chuẩn giao thức phát triển nhằm mục tiêu truyền tải các lệnh SCSI qua mạng bằng giao thức TCP/IP.

iSCSI cho phép truy cập các khối dữ liệu trên hệ thống lưu trữ SAN qua các lệnh SCSI và truyền tải dữ liệu qua hệ thống mạng network (LAN/WAN).

iSCSI sẽ giúp tạo 1 ổ cứng Local trong máy tính của bạn với mọi chức năng y như 1 ổ cứng gắn trong máy tính vậy. Chỉ khác ở chỗ dung lượng thực tế nằm trên NAS và do NAS quản lý.

### Sự khác biệt của NFS và iSCSI:
NFS làm việc ở file system level còn iSCSI làm ở block device level

## Cách thực hiện

### Trên Target (Server)

- Cài đặt:

```
sudo apt-get update -y

sudo apt-get install iscsitarget iscsitarget-dkms -y
```

- Tạo thư mục:

` sudo mkdir /storage`

- Sử dụng lệnh `dd` để tạo ra các image trong `/storage`, ở đây tôi lab với nên sẽ tạo một file 10M cho nhanh và nhẹ

`sudo dd if=/dev/zero of=/storage/lun1.img bs=10kB count=1000`

- Sửa file `/etc/default/iscsitarget`:

`ISCSITARGET_ENABLE=true`

- Cấu hình file `/etc/iet/ietd.conf` để khai báo iSCSI taget vừa tạo:

````Target iqn.2017-07.ttp.vn:storage.lun1

Lun 0 Path=/storage/lun1.img,Type=fileio

initiator-address 192.168.0.168`

incominguser thanh thanh1997
````


Khởi động lại:

`systemctl restart open-iscsi.service`

Kiểm tra lại xem đã kết nối tới server chưa, sử dụng một trong 2 lệnh sau:
```buildoutcfg
$ ss -atnp | grep 3260 # 3260 la port iSCSI service
LISTEN     0      32           *:3260                     *:*                   users:(("ietd",pid=1466,fd=7))
LISTEN     0      32          :::3260                    :::*                   users:(("ietd",pid=1466,fd=8))
```

### Trên Initiator (client)
- Cài đặt iSCSI:
`sudo apt-get install open-iscsi -y`

Sửa file /etc/iscsi/iscsid.conf
```buildoutcfg
node.startup = automatic
node.session.auth.authmethod = CHAP
# line 60,61: uncomment and specify the username and password you set on the iSCSI target
node.session.auth.username = username
node.session.auth.password = password

```
- Kiểm tra
```
scsiadm -m discovery -t st -p 192.168.0.136
$ iscsiadm -m node
192.168.0.136:3260,1 iqn.2017-07.ttp.vn:storage.lun1
```

- Login
` iscsiadm -m node --targetname "iqn.2017-07.ttp.vn:storage.lun1" --portal "10.10.10.10:3260" --login`

- Kiểm tra lại:
```
$ !l
lsblk
NAME                            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                               8:0    0   20G  0 disk
├─sda1                            8:1    0  487M  0 part /boot
├─sda2                            8:2    0    1K  0 part
└─sda5                            8:5    0 19.5G  0 part
  ├─intern--meditech--vg-root   252:0    0   19G  0 lvm  /
  └─intern--meditech--vg-swap_1 252:1    0  512M  0 lvm  [SWAP]
sdb                               8:16   0  9.5M  0 disk
sr0                              11:0    1  655M  0 rom
```
Chúng ta sẽ nhìn thấy có thêm một ổ mới sdb với dung lượng 9.5M chính là image lun1.img bên target. sdb sẽ đóng vai trò như một ổ thật và có thể sử dụng nó bình thường như những ổ khác nhưng dữ liệu trên đó thực sự lại được lưu trên máy target. Lúc này dung lượng được lấy từ máy target và chia sẻ với máy initiator qua giao thức iSCSI.



