brew install md5sha1sum
printf 'hello' | sha1sum

openssl aes-256-cbc
-- 文件加密
-- 加密后的文件包含salt和加密内容，完全自包含。解密时提供密码解密。
openssl aes-256-cbc -salt -in readme.md -out readme.enc.md
-- 文件解密
openssl aes-256-cbc -d -in readme.enc.md -out readme.dec.md

-- AES加密
uuidgen > encrypt.key
read encryptKey < encrypt.key
openssl enc -e -aes128 -k $encryptKey -a -in helloworld.txt -out helloworld.enc.txt
-e：表示加密
-k：表示密钥
-a：base64
-in：输入
-out：输出

-- AES解密
openssl enc -d -aes128 -k $encryptKey -a -in helloworld.enc.txt -out helloworld.dec.txt

-- RSA 私钥加密


-- RSA 公钥加密


-- 生成RSA私钥和公钥
openssl genrsa -out private.key
openssl genrsa -out private.key 2048
openssl rsa -in private.key -pubout -out pubkey

-- 生成AES密钥
uuidgen > encrypt.keys
