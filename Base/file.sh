#创建目录
mkdir -p dir1/dir2 
cd dir1 
#创建文件
touch f1.txt 
touch f2.txt 
touch f3.txt 
touch f4.txt 
#批量移动文件
find -name '*.txt' -exec mv {} ./dir2 \; 
#find -name '*.txt' -exec mv {} J:/CLI/base/dir1/dir2/ \; 

#删除文件夹
rm -r 1
#删除文件
rm -f 1.txt
#or
rm 1.txt

#权限
chmod -R 775 dir