#!/bin/bash
echo "CHAO MUNG BAN DEN VOI SCRIPT CUA THANH DEP TRAI"
echo "Moi ban nhap ip"
read
ip="$REPLY"
echo "Moi ban nhap user"
read
user="$REPLY"
PRI_KEY=~/.ssh/$ip.key
PUB_KEY=$PRI_KEY.pub
if [ -f $PRI_KEY ]
then
echo "Da co key ban tu dang nhap di :) "
echo "Dung cai lenh nay ssh -o 'StrictHostKeyChecking no' -i $PRI_KEY $user@$ip de login nha."
exit 0
else
echo "Ahihi, moi ban nhap password"
read
password="$REPLY"
echo "Cung tai sshpass nao =)))"
sudo apt-get install sshpass 
echo "Tao key nha"
ssh-keygen -t rsa -N "" -f $PRI_KEY 
sudo sshpass -p "$password" ssh-copy-id -o "StrictHostKeyChecking no" -i $PUB_KEY -f $user@$ip
if [ $? -eq 0 ]; then
sudo rm $PUB_KEY
echo "Dung cai lenh nay ssh -o 'StrictHostKeyChecking no' -i $PRI_KEY $user@$ip de login nha."
echo "Hihi."
else
sudo rm $PRI_KEY*
echo "chua duoc thu lai di co loi r"
fi
fi
