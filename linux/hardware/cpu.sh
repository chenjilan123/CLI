// 获取cpu核心数
cat /proc/cpuinfo | grep 'core id'| sort -u | wc -l