后台开启服务：
nohup dotnet AlarmCenterGrpcServiceLibrary.dll > /dev/null 2>&1 &
nohup dotnet IoTCenterWebApi.dll > /dev/null 2>&1 &

查看进程：
ps -ef|grep dotnet

关闭进程：
kill -9  进程号

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