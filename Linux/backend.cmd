# 后台运行，并且不保存日志
sudo nohup dotnet GWHost1.dll >/dev/null 2>&1 & 

# 后台运行，把日志保存到nohup.out文件（一般调试用）
nohup dotnet GWHost1.dll &

# 获取输出
tail -f nohup.out

#查看任务
jobs
#后台运行
fg %n
bg %n