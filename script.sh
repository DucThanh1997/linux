echo "Welcome to script"
check_distro()
{
os=$(lsb_release -is)   #in ra hệ điều hành
release=$(lsb_release -rs)   # in ra phiên bản
if [ $os != 'Ubuntu' ] && [ $release != '16.04' ]
then
echo "Script available to Ubuntu 16.04!"
echo "ERROR: This OS is not compatible" >> /var/log/ssh_gen_key.log
exit 1
fi
}
ssh_gen_key(){
echo "Enter IP server: "
read ip_server
key_pri=~/.ssh/$ip_server.key
key_pub=$key_pri.pub
user=$(logname)
if [ -f $key_pri ]    # Kiểm tra xem đã tồn tại cái này chưa
then
echo "Existed key for server."
echo "Use ssh -o 'StrictHostKeyChecking no' -i $key_pri your_username@$ip_server to login server."
exit 0
else
echo "Enter username to login: "
read username
echo "Enter password for user $username: "
read password
echo "Generating key pair..."
ssh-keygen -t rsa -N "" -f $key_pri -q    # tạo key loại rsa vào thư mục của biến key_pri rồi chuyển sang function add_key 
add_key
fi
}
add_key()
{
echo "Adding key on server..."
install_sshpass # cho chạy fuction install sshpass
sudo sshpass -p "$password" ssh-copy-id -o "StrictHostKeyChecking no" -i $key_pub -f $username@$ip_server # copy key sang cái server kia
if [ $? -eq 0 ]; then
sudo rm $key_pub
echo "Use ssh -o 'StrictHostKeyChecking no' -i $key_pri $username@$ip_server to login server."
echo "Finished."
else
sudo rm $key_pri*
echo "Don't copy key on server"
fi
}
install_sshpass()
{
sshpass -V &> /dev/null
if [ $? -ne 0 ]
then
echo "Installing sshpass ..."
# echo $your_password | sudo -S apt-get install sshpass
sudo apt-get install sshpass &> /dev/nul
fi
}
main()
{
check_distro
ssh_gen_key
}
main
