export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

# URL=https://raw.githubusercontent.com/Lvellios/Block-IP/main/Levels/level_1.deny.gz
# URL=https://raw.githubusercontent.com/Lvellios/Block-IP/main/Levels/level_2.deny.gz
# URL=https://raw.githubusercontent.com/Lvellios/Block-IP/main/Levels/level_3.deny.gz
# URL=https://raw.githubusercontent.com/Lvellios/Block-IP/main/Levels/level_4.deny.gz
URL=https://raw.githubusercontent.com/Lvellios/Block-IP/main/Levels/default.deny.gz
HOSTSDENY=/etc/hosts.deny
TMP_DIR=/dev/shm
FILE=hosts.deny

[ -d $TMP_DIR ] || TMP_DIR=/tmp

cd $TMP_DIR

curl --connect-timeout 60 $URL 2> /dev/null | gzip -dc > $FILE 2> /dev/null

LINES=`grep "^sshd:" $FILE | wc -l`

if [ $LINES -gt 10 ]
then
	sed -i '/^####SSH BlackList START####/,/^####SSH BlackList END####/d' $HOSTSDENY
	echo "####SSH BlackList START####" >> $HOSTSDENY
	cat $FILE >> $HOSTSDENY
	echo "####SSH BlackList END####" >> $HOSTSDENY
fi
