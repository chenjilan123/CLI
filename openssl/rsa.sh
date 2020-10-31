-- 生成RSA私钥
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -pkeyopt rsa_keygen_pubexp:3 -out privkey-A.pem

-- 查看私钥
openssl pkey -in privkey-A.pem -text

-- 生成RSA公钥
openssl pkey -in privkey-A.pem -out pubkey-A.pem -pubout

-- 查看公钥
openssl pkey -in pubkey-A.pem -pubin -text