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