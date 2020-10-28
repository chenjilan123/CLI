curl https://postman-echo.com/get?foo1=bar1&foo2=bar2
pause

-o: 输出到指定文件
-O:下载文件
-i:包含头部
-I --head: 仅头部
--data：数据部分
-d：
-X PUT：指定Http请求方式
-X DELETE：指定Http请求方式

curl -u brad:12345 http://xxx.xxx.xxx

-L：
-- Ftp上传
curl -u test@catoso.com:123456! -T hello.txt ftp://ftp.catoso.com
-- Ftp下载
curl -u test@catoso.com:123456! -O ftp://ftp.catoso.com/hello.txt