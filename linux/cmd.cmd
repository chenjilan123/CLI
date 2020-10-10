#!后台开启服务：
nohup dotnet AlarmCenterGrpcServiceLibrary.dll > /dev/null 2>&1 &
nohup dotnet IoTCenterWebApi.dll > /dev/null 2>&1 &

#!查看进程：
ps -ef|grep dotnet

#!关闭进程：
kill -9  进程号

#!ss命令
ss -lntup

#!nc命令
nc 127.0.0.1 22

#!ssh服务的启动与安装

#!安装
sudo apt-get install ssh
#!启动
service sshd start
#!配置
vim /etc/ssh/sshd_config

#!vim修改只读文件
w !sudo tee %
q!