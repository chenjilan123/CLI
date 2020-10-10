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


#!Regex
echo 'abcabbc' | sed -E 's/(ab|bc)*//g'
cat ssh.log | sed -E 's/^.*Disconnected from (invalid | authenticating )?user (.*) [0-9]+ port [0-9]+( \[preauth\])?$/\2/' | head -n100
cat ssh.log | sed -E 's/^.*Disconnected from (invalid | authenticating )?user (.*) [0-9]+ port [0-9]+( \[preauth\])?$/\2/' | sort | uniq -c | awk 'BEGIN { rows = 0 } $1 == 1 && $2 ~ /^c.*e$/ {rows += 1 } END { print rows }'

#!sort & uniq
cat LICENSE.txt | sort | uniq -c
#!awk & paste
cat LICENSE.txt | sort | uniq -c | awk '{print $2}' | paste -sd,

#!bc
echo '1 + 2' | bc

#!R
echo '1
2
3
4' | R --slave -e 'x <- scan(file="stdin", quiet=TRUE); summary(x)'
echo 'mike
mike
mark
mark
mark
jack
jack' | sort | uniq -c | sort -nk1,1 | tail -n5 | gnuplot -p -e 'set boxwidth 0.5; plot "-" using 1:xtic(2) with boxes'

#!Data Wrapping
rustup toolchain list | grep nightly | grep -v 'nightly-84' | grep 2019 | sed 's/-x86.*//' | xargs rustup toolchain uninstall
ffmpeg -loglevel panic -i /dev/video0 -frames 1 -f image2 - | convert - -colorspace gray - | gzip | ssh tsp 'gzip -d | tee copy.png' | feh -

#! debugging & profiling
#!logs
cd /var/log
log show --last 10s 
logger "Hello Logs"
log show --last 1m | grep Hello
#! highlight error

#! ipdb
npm install ipdb
python -m ipdb bubble.py
# list code
l
#! Step
s
# start debugging
restart
# continue
c
# print array arr
p arr
# print variable j
p j
#! Quit
q
#! Set break point
b 6
c
p locals()
s

#! gdb: displays low level information for c/c++
gdb --args sleep 20

sudo strace ls -l > /dev/null
sudo dtruss ls -l > /dev/null

pyflakes lint.py
mypy lint.py

#! Profiling
time curl baidu.com
#! 跟踪分析器
#！探查分析器
python -m cProgile -s tottime grep.py 1000 '^(import|\s*def)[^,]*$' *.py