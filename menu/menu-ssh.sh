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
export CHATID="5795571992"
export KEY="6351704520:AAEG3kwRGOUT4ta1e_q904v1zd-NtLFdXLE"
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
    echo -e "      \033[0;36mTelegram${NC} t.me/YSSHstore"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/081215360549"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
echo -e "\e[32mloading...\e[0m"
clear
#Domain
domain=$(cat /etc/xray/domain)

echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "                SSH & OpenVPN           "
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "  ${ORANGE}[1].${NC}\033[0;36m Create SSH & OpenVPN Account${NC}"
echo -e "  ${ORANGE}[2].${NC}\033[0;36m Trial SSH & OpenVPN ${NC}"
echo -e "  ${ORANGE}[3].${NC}\033[0;36m Renew SSH & OpenVPN ${NC}"
echo -e "  ${ORANGE}[4].${NC}\033[0;36m Check User Login SSH & OpenVPN${NC}"
echo -e "  ${ORANGE}[5].${NC}\033[0;36m Daftar Member SSH & OpenVPN ${NC}"
echo -e "  ${ORANGE}[6].${NC}\033[0;36m Hapus SSH & OpenVpn Account ${NC}"
echo -e "  ${ORANGE}[7].${NC}\033[0;36m Hapus User Expired SSH & OpenVPN ${NC}"
echo -e "  ${ORANGE}[8].${NC}\033[0;36m Set up Autokill SSH ${NC}"
echo -e "  ${ORANGE}[9].${NC}\033[0;36m Cek User Multi Login SSH ${NC}"
echo -e " ${ORANGE}[10].${NC}\033[0;36m Lock Account User ${NC}"
echo -e " ${ORANGE}[11].${NC}\033[0;36m Unlock Account User ${NC}"
echo -e " ${ORANGE}[12].${NC}\033[0;36m Exit ${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
read -p "Select From Options [ 1 - 12 ] : " menu
echo -e ""
case $menu in
1)
    usernew
    ;;
2)
    trial
    ;;
3)
    renew
    ;;
4)
    cek
    ;;
5)
    member
    ;;
6)
    hapus
    ;;
7)
    delete
    ;;
8)
    autokill
    ;;
9)
    ceklim
    ;;
10)
    user-lock
    ;;
11)
    user-unlock
    ;;    
*)
    menu
    ;;
esac
