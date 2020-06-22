set-executionpolicy remotesigned
netsh http add urlacl url=http://+:10099/ user=l listen=yes
pause