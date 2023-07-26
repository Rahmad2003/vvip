#!/bin/bash
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
AKUN="AKUN SSH"
TIMES="10"
CHATID="-922222061"
KEY="6383900821:AAGrdOhs_cJ9ILZUUofrrfHyQLK2r0yMkcU"
URL="https://api.telegram.org/bot$KEY/sendMessage"
hariini=`date -d "0 days" +"%Y-%m-%d"`
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/Rahmad2003/izin/main/ip"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/WokszXD"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6285279323958"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
echo -e "\e[32mloading...\e[0m"
clear
export TIME="10"
IP=$(curl -sS ipv4.icanhazip.com)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
domain=$(cat /etc/xray/domain)
sldomain=$(cat /etc/xray/dns)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /etc/slowdns/server.pub)
clear
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " SSH OVPN Account           "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
read -p " Username : " Login
read -p " Password : " Pass
read -p " Limit IP : " iplimit
read -p " Quota    : " Quota
read -p " Expired (Hari) : " masaaktif
limitip
if [[ $iplimit -gt 0 ]]; then
echo -e "$iplimit" > /etc/kyt/limit/ssh/ip/$Login
else
echo > /dev/null
fi
clear
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`

if [ ! -e /etc/ssh ]; then
  mkdir -p /etc/ssh
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${Login}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^#ssh#" | grep -w "${Login}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${Login}\b/d" /etc/ssh/.ssh.db
fi
echo "#ssh# ${Login} ${Pass} ${Quota} ${expe}" >>/etc/ssh/.ssh.db
clear

cat > /var/www/html/ssh-$Login.txt <<-END
◇━━━━━━━━━━━━━━━━━◇
Y O G Z  P R O J E C T 
◇━━━━━━━━━━━━━━━━━◇

Format SSH OVPN Account
◇━━━━━━━━━━━━━━━━━◇
Username         : $Login
Password         : $Pass
◇━━━━━━━━━━━━━━━━━◇
IP               : $IP
Host             : $domain
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 443, 109
Port Dropbear WS : 443, 109
Port SSH UDP     : 1-65535
Port SSH WS      : 80, 8080, 8081-9999
Port SSH SSL WS  : 443
Port SSL/TLS     : 400-900
Port OVPN WS SSL : 443
Port OVPN SSL    : 443
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200
BadVPN UDP       : 7100, 7300, 7300
◇━━━━━━━━━━━━━━━━━◇
Aktif Selama     : $masaaktif Hari
Dibuat Pada      : $tnggl
Berakhir Pada    : $expe
◇━━━━━━━━━━━━━━━━━◇
Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf] 
◇━━━━━━━━━━━━━━━━━◇
OVPN Download : https://$domain:81/
◇━━━━━━━━━━━━━━━━━◇

END
TEXT="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>SSH OVPN Account     </code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Username         : </code> <code>$Login</code>
<code>Password         : </code> <code>$Pass</code>
<code>Limit Quota      : </code> <code>$Quota</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>IP               : $IP</code>
<code>Host             : </code> <code>$domain</code>
<code>Port OpenSSH     : 443, 80, 22</code>
<code>Port Dropbear    : 443, 109</code>
<code>Port SSH WS      : 80, 8080, 8081-9999 </code>
<code>Port SSH UDP     : 1-65535 </code>
<code>Port SSH SSL WS  : 443</code>
<code>Port SSL/TLS     : 400-900</code>
<code>Port OVPN WS SSL : 443</code>
<code>Port OVPN SSL    : 443</code>
<code>Port OVPN TCP    : 443, 1194</code>
<code>Port OVPN UDP    : 2200</code>
<code>BadVPN UDP       : 7100, 7300, 7300</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Payload WSS      : </code><code>GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
OVPN Download : https://$domain:81/
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Save Link Account: </code>https://$domain:81/ssh-$Login.txt
<code>◇━━━━━━━━━━━━━━━━━◇</code>
Aktif Selama         : $masaaktif Hari
Dibuat Pada          : $tnggl
Berakhir Pada        : $expe
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "SSH OVPN Account" | tee -a /etc/log-create-user.log
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "Username    : $Login" | tee -a /etc/log-create-user.log
echo -e "Password    : $Pass" | tee -a /etc/log-create-user.log
echo -e "Limit IP    : $iplimit" | tee -a /etc/log-create-user.log
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "HOST        : $domain" | tee -a /etc/log-create-user.log
echo -e "Nameserver  : $sldomain" | tee -a /etc/log-create-user.log
echo -e "PubKey      : $slkey" | tee -a /etc/log-create-user.log
echo -e "UdpCustom   : 1-65535" | tee -a /etc/log-create-user.log                 
echo -e "OpenSSH     : 22" | tee -a /etc/log-create-user.log
echo -e "Dropbear    : 80,90,69,143" | tee -a /etc/log-create-user.log
echo -e "OpenSSH SSL : 443" | tee -a /etc/log-create-user.log
echo -e "Dropbear SSL: 443" | tee -a /etc/log-create-user.log
echo -e "SlowDNS     : 53,5300,443" 
echo -e "BadVPN UDPGW: 7100-7300" | tee -a /etc/log-create-user.log
echo -e "OpenVPN TCP : 80,1194" | tee -a /etc/log-create-user.log
echo -e "OpenVPN SSL : 443" | tee -a /etc/log-create-user.log
echo -e "OpenVPN UDP : 25000" | tee -a /etc/log-create-user.log
echo -e "OpenVPN WS  : 7444" | tee -a /etc/log-create-user.log
echo -e "OpenVPN SSL : 7443" | tee -a /etc/log-create-user.log
echo -e "OpenVPN DNS : 53" | tee -a /etc/log-create-user.log
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload WSS" | tee -a /etc/log-create-user.log  
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/log-create-user.log
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "OVPN Download : https://$domain:81/" | tee -a /etc/log-create-user.log
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "Save Link Account: https://$domain:81/ssh-$Login.txt" | tee -a /etc/log-create-user.log
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo -e "Aktif Selama  : $masaaktif Hari" | tee -a /etc/log-create-user.log
echo -e "Dibuat Pada   : $tnggl" | tee -a /etc/log-create-user.log
echo -e "Berakhir Pada : $expe" | tee -a /etc/log-create-user.log
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
