#!/bin/bash
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
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
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
domain=$(cat /etc/xray/domain)
masaaktif=1
Quota=5
user=Trial-VL`</dev/urandom tr -dc 0-9 | head -c3`
clear 
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
sed -i '/#vless$/a\#vl# '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#vl# '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
clear
vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
cat >/var/www/html/vless-$user.txt <<-END

◇━━━━━━━━━━━━━━━━━◇
  G E O  P R O J E C T 
◇━━━━━━━━━━━━━━━━━◇
 https://github.com/wokszxd
◇━━━━━━━━━━━━━━━━━◇
# Format Vless WS TLS

- name: Vless-$user-WS TLS
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}

# Format Vless WS Non TLS

- name: Vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
  udp: true

# Format Vless gRPC (SNI)

- name: Vless-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
    grpc-service-name: vless-grpc

◇━━━━━━━━━━━━━━━━━◇
Link Akun Vless 
◇━━━━━━━━━━━━━━━━━◇
Link TLS      : 
${vlesslink1}
◇━━━━━━━━━━━━━━━━━◇
Link none TLS : 
${vlesslink2}
◇━━━━━━━━━━━━━━━━━◇
Link GRPC     : 
${vlesslink3}
◇━━━━━━━━━━━━━━━━━◇


END

systemctl restart xray
systemctl restart nginx
clear
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " CREATE VLESS ACCOUNT           "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
#echo -e "User Quota  : ${Quota} GB"
echo -e "port TLS    : 400-900"
#echo -e "Port DNS    : 443"
echo -e "Port NTLS   : 80, 8080, 8081-9999"
echo -e "User ID     : ${uuid}"
echo -e "Encryption  : none"
echo -e "Path TLS    : /vless "
echo -e "ServiceName : vless-grpc"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link TLS    : ${vlesslink1}"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link NTLS   : ${vlesslink2}"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link GRPC   : ${vlesslink3}"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Format OpenClash : https://${domain}:81/vless-$user.txt"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Aktif Selama     : $masaaktif Hari"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $expe"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"

menu-vless