sudo apt-get remove openssh-server
sudo apt-get install openssh-server

sudo vi /etc/ssh/sshd_config
--Port 22 #默认即可，如果有端口占用可以自己修改
--PasswordAuthentication yes # 允许用户名密码方式登录

sudo service ssh restart
