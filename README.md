# The List of Block IP

## Before the Start

Check if your SSHD supports TCP Wrapper
```
ldd `which sshd` | grep libwrap
```
## install Script

```
cd /usr/local/bin/
wget https://raw.githubusercontent.com/Lvellios/Block-IP/main/Block_IP.sh
chmod +x Block_IP.sh
cd /etc/cron.daily/
ln -s /usr/local/bin/Block_IP.sh .
./Block_IP.sh
```
## Update
```
bash /usr/local/bin/Block_IP.sh
```
## Thanks for
- [Stamparm](https://github.com/stamparm/ipsum)