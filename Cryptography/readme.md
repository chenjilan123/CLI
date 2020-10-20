Entropy

Hash functions

Key derivation functions(KDFs)
PBKDF2()





Symmetric key cryptography(AES算法)
keygen() -> key
 - encrypt(plaintext, key) -> ciphertext
 - decrypt(ciphertext, key) -> plaintext

 - given ciphertext can't figure out plaintext(without key)
 - decrypt(encrypt(m,k),k)=m

-- web站点加密
Passphrase -> KDFs -> Key
encrypt(plaintext, key) = cryptography

-- 彩虹桌 rainbow table，通过哈希映像暴力破解密码
hash(pw)

-- 改进，加salt
salt <- random()
salt,hash(pwd+salt)


Asymmetric Key Cryptography
Keygen() -> (public key, private key)
encrypt(p, public key) -> c
decrypt(c, private key) -> 

Signing and Veryfing(RSA算法)
sign(message, private key) -> signature
verify(message, public key) -> ok
优点：
1.难以伪造签名（除非获得私钥）
2.验证

用处：
1.加密邮件
2.信号服务器
3.Debian文件验证
4.git commit密钥

5.(Interesting)Hybrid encryption(非对称加密+对称加密)








