# File Permission
Trong Linux, mỗi file đều có 1 người sở hữu riêng, 1 group sở hữu riêng với các quyền như đọc, ghi, thực thi

## Một số lệnh phân quyền
`chown` : sử dụng để thay đổi chủ sở hữu của file hoặc thư mục 

**Cú pháp**: chmod [option] [permission] [name file/directory]

Ví dụ: chmod u+rwx thanh.txt

`chgrp` : sử dụng để thay đổi nhóm sở hữu của file hoặc thư mục

`chmod` : sử dụng để thay đổi quyền của file Files có 3 quyền là read(r), write(w) và execute(x).

thứ tự thông thường là: `rwx`

Các quyền được chia thành 3 nhóm: người sở hữu user(u), nhóm sở hữu group(g) và người dùng khác others(o)
có một số cách khác để sử dụng lệnh chmod. ví dụ như cấp quyền thực thi cho nhóm

Mấy cái rwx khá là khó nhớ nên chúng ta có cách như sau

Cấp quyền cho người dùng cách trên có vẻ khó ghi và nhớ, có một cách đơn giản hơn là định danh cho các quyền bằng các chữ số: 4 cho quyền đọc 2 cho quyền ghi 1 cho quyền thực thi

Như vậy 7 có nghĩa là được thực hiện cả 3 quyền đọc, ghi và thực thi (4+2+1) hay 6 có nghĩa là được thực hiện đọc và ghi (4+2) hay 5 có nghĩa là đọc và thực thi (4+1)

Khi sử dụng cách cấp quyền trên với lệnh chmod như sau:

`chmod 777 test1.txt`
