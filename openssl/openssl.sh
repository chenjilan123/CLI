-- 确认安装版本
openssl version

-- 加密命令
openssl list -cipher-commands
-- AES加密
openssl enc -aes-256-cbc -base64 -in msg > msg.enc
openssl enc -aes-256-cbc -base64 -in msg -out msg.enc
-- AES解密
openssl enc -aes-256-cbc -d -base64 -in msg.enc -out msg.dec

-- 加密解密
-- 生成私钥
openssl genrsa -out keypair.pem 2048
-- 查看私钥信息
openssl rsa -in keypair.pem -text
-- 生成公钥
openssl rsa -in keypair.pem -pubout -out public.pem

-- 使用公钥加密，私钥解密(received.txt为enc的副本)
openssl rsautl -encrypt -in msg.txt -out enc -inkey publicA.pem -pubin
openssl rsautl -decrypt -in received.txt -out msg.txt -inkey privateA

-- 使用私钥签名，公钥验证
openssl rsautl -sign -in msg.txt -out signed -inkey keypair.pem
openssl rsautl -verify -in signed -out signedFile -inkey public.pem -pubin
-- 更安全（附加验证短语）
openssl rsa -in keypair.pem -des3 -out privateA.pem
openssl rsautl -sign -in msg.txt -out signed1 -inkey privateA.pem
openssl rsautl -verify -in signed1 -out signedFile1 -inkey public.pem -pubin

-- 链接，类似快捷方式
ln -s /home/chenjilan/ssl/A/publicA.pem










