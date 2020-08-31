后台开启服务：
nohup dotnet AlarmCenterGrpcServiceLibrary.dll > /dev/null 2>&1 &
nohup dotnet IoTCenterWebApi.dll > /dev/null 2>&1 &

查看进程：
ps -ef|grep dotnet

关闭进程：
kill -9  进程号