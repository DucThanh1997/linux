# key ssh authentication
## Định nghĩa:
tạo cho server và client 1 cặp public và private key kiểu như chìa vs ổ khóa ý server có cái private key là ổ khóa
còn public trên client đúng chìa đúng ổ thì vào được không cần phải hỏi đi hỏi lại 1 câu MÀY LÀ THẰNG NÀO rồi mới được vào nhà. 
Có chìa thì cứ vào thôi
## Các bước thực hiện
B1: trên server tạo cặp key public và private

`ssh-keygen`

B2: copy sang máy client

`ssh-copy-id root@198.162.40.100`

B3: đưa key vào agent:
```
Khời động ssh agent
eval $(ssh-agent -s)
ssh-add -l
```

Sau đây đăng nhập vào mà sẽ không cần password

# Schedule task
## Định nghĩa: 
Giống như kiểu 1 việc làm cố định nào đấy mà chúng ta sẽ đặt giờ cho máy tính làm

## Ví dụ:
- Hẹn giờ việc làm qua crontab:
` sudo nano /etc/crontab/ `
- Cấu trúc của 1 schedule process sẽ như sau:
` m h dom mon dow user  command   `
chẳng hạn
` 13 9    * * *   root   ls /home/thanh/Desktop >> /home/thanh/a.txt  `

# load average
Chỉ số load process trung bình của hệ điều hành trong 1 5 và 15 phút

![image](https://user-images.githubusercontent.com/45547213/50597685-db838600-0eda-11e9-9472-4f15cc748bc0.png)

# umask
nôm na có thể hiểu là khi bạn t 1 file và chưa sử dụng lệnh chmod nào cả thì các quyền sẽ được phân chia theo umask

Vì Base Permission của file bất kỳ luôn là 666 (tức 110110110 khi chuyển sang dạng nhị phân), 
nên nếu giá trị mask là 022 (có dạng nhị phân là 000010010 => dạng bù 1 của nó thì chuyển 1->0, 0->1 nên ta được 111101101) 
thì quyền truy nhập chính thức của file sẽ là:
110 110 110 AND 111 101 101 = 110 100 100 = 644 (rw-r–r–)
