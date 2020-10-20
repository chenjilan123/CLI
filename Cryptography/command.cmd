brew install md5sha1sum
printf 'hello' | sha1sum

openssl aes-256-cbc
-- 文件加密
-- 加密后的文件包含salt和加密内容，完全自包含。解密时提供密码解密。
openssl aes-256-cbc -salt -in readme.md -out readme.enc.md
-- 文件解密
openssl aes-256-cbc -d -in readme.enc.md -out readme.dec.md