#!/bin/bash 
# COLOR VALIDATION
clear
L1="\e[0m\e[1;77m"
y='\033[1;33m' #yellow
BGX="\033[42m"
CYAN="\033[96m"
z="\033[96m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
 # ========================================= 
 vlx=$(grep -c -E "^#vl# " "/etc/xray/config.json") 
 let vla=$vlx/2 
 vmc=$(grep -c -E "^#vm# " "/etc/xray/config.json") 
 let vma=$vmc/2 
 ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)" 
  
 trx=$(grep -c -E "^#tr# " "/etc/xray/config.json") 
 let tra=$trx/2 
 ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json") 
 let ssa=$ssx/2 
 COLOR1='\033[0;35m' 
 COLOR2='\033[0;39m' 
 clear

BURIQ () {
    curl -sS https://raw.githubusercontent.com/Rahmad2003/izin/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Rahmad2003/izin/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/Rahmad2003/izin/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/Rahmad2003/izin/main/ip | grep $MYIP | awk '{print $3}')
fi

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIRU='\033[1;94m'       # Blue
BAYS='\033[1;95m'     # Purple
AYG='\033[1;96m'       # Cyan
PUTIH='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
NILA='\033[0;95m'      # Purple
ZIL='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip)
domain=$(cat /etc/xray/domain)
uptime="$(uptime -p | cut -d " " -f 2-10)"
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
domain=$(cat /etc/xray/domain)
nsdomain=$(cat /etc/xray/dns)
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)today
up=$(uptime | awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
tram=$(free -m | awk 'NR==2 {print $2}')
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*/} / ${corediilik:-1}))"
cpu_usage+=" %"
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)

clear

# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

###########- END COLOR CODE -##########
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
cd
if [ ! -e /etc/xray/city ]; then
curl -s ipinfo.io/city?token=75082b4831f909 > /etc/xray/city
curl -s ipinfo.io/org?token=75082b4831f909  | cut -d " " -f 2-10 > /etc/xray/isp
fi
cityy=$(cat /etc/xray/city | wc -l)
if [[ $cityy == "1" ]]; then
echo -ne
else
rm -rf /etc/xray/city
rm -rf /etc/xray/isp
fi
CITY=$(cat /etc/xray/city )
ISP=$(cat /etc/xray/isp )
# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
USAGERAM=$(free -m | awk 'NR==2 {print $3}')

# Status ExpiRED Active | WokszXD
Info="(${c2}Active${NC})"
Error="(${red}Expired${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/Rahmad2003/izin/main/ip | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
#persencpu=
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"

###########
KANAN="\033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC"
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
########
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [[ "$ssh" == "active" ]]; then 
resssh="${green}ON✓${NC}"
else
status_ssh="${RED}🔴${NC} "
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON✓${NC}"
else
resst="${red}🔴${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON✓${NC}"
else
ressshws="${red}🔴${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON✓${NC}"
else
resngx="${red}🔴${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON✓${NC}"
else
resdbr="${red}🔴${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON✓${NC}"
else
resv2r="${red}🔴${NC}"
fi
function addhost(){
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
setting-menu
else
echo "IP=$host" > /var/lib/scrz-prem/ipvps.conf
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew cert"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
}
function genssl(){
clear
systemctl stop nginx
domain=$(cat /var/lib/scrz-prem/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /etc/xray/domain
systemctl restart xray
systemctl restart nginx
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
export sem=$( curl -s https://raw.githubusercontent.com/YOGZKNTL/regip/main/versions)
export pak=$( cat /home/.ver)
IPVPS=$(curl -s ipinfo.io/ip )
#################
r="\033[1;31m"  #REDTERANG
a=" ${CYAN}ACCOUNT PREMIUM" 
################
if [ ! -e /etc/vmess ]; then
    mkdir -p /etc/vmess
    touch /etc/vmess/.vmess.db
fi
vms=$(cat /etc/vmess/.vmess.db)
if [[ $vms = "" ]]; then
    vm="0"
else
    vm=$(cat /etc/vmess/.vmess.db | grep "#vm#" | wc -l)
fi

if [ ! -e /etc/vless ]; then
    mkdir -p /etc/vless
    touch /etc/vless/.vless.db
fi
vms=$(cat /etc/vless/.vless.db)
if [[ $vms = "" ]]; then
    vl="0"
else
    vl=$(cat /etc/vless/.vless.db | grep "#vl#" | wc -l)
fi
echo ""
if [ ! -e /etc/trojan ]; then
    mkdir -p /etc/trojan
    touch /etc/trojan/.trojan.db
fi
vms=$(cat /etc/trojan/.trojan.db)
if [[ $vms = "" ]]; then
    tr="0"
else
    tr=$(cat /etc/trojan/.trojan.db | grep "#tr#" | wc -l)
fi
if [ ! -e /etc/shadowsocks ]; then
    mkdir -p /etc/shadowsocks
    touch /etc/shadowsocks/.shadowsocks.db
fi
vms=$(cat /etc/shadowsocks/.shadowsocks.db)
if [[ $vms = "" ]]; then
    ss="0"
else
    ss=$(cat /etc/shadowsocks/.shadowsocks.db | grep "#ss#" | wc -l)
fi
if [ ! -e /etc/ssh ]; then
    mkdir -p /etc/ssh
    touch /etc/ssh/.ssh.db
fi
vms=$(cat /etc/ssh/.ssh.db)
if [[ $vms = "" ]]; then
    ssh="0"
else
    ssh=$(cat /etc/ssh/.ssh.db | grep "#ssh1#" | wc -l)
fi
clear
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC\033[41m         WELCOME TO SCRIPT PREMIUM MADEST STORE           $NC${z}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│   $NC$r ¶$NC${z}  SYSTEM OS      $blue=$NC $MODEL${NC}"
echo -e " ${z}│   $NC$r ¶ $NC${z} CITY & ISP    $blue=$NC $CITY $ISP ${NC}"
echo -e " ${z}│   $NC$r ¶ $NC${z} SERVER RAM    $blue=$NC $RAM MB / $USAGERAM MB ${NC}"
echo -e " ${z}│   $NC$r ¶ $NC${z} UPTIME SERVER $blue=$NC $uptime${NC}"
echo -e " ${z}│   $NC$r ¶ $NC${z} DATE          $blue=$NC $DATEVPS${NC}"
echo -e " ${z}│   $NC$r ¶ $NC${z} TIME          $blue=$NC $TIMEZONE${NC}"
echo -e " ${z}│   $NC$r ¶ $NC${z} IP VPS        $blue=$NC $MYIP${NC}"
echo -e " ${z}│   $NC$r ¶ $NC${z} DOMAIN        $blue=$NC $domain${NC}"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e "      ${KIRI} ${CYAN}•TERIMAKASIH SUDAH MENGGUNAKAN SCRIP INI•${NC} ${KANAN}"
echo -e "       ───────────────────────────────────────────────${NC}" | lolcat 
echo -e "           ${CYAN}SSH/OPENVPN${NC}    $y=$NC $ssh1${NC}" "$a"
echo -e "           ${CYAN}VMESS/WS/GRPC${NC}  $y=$NC $vma$NC" "$a"
echo -e "           ${CYAN}VLESS/WS/GRPC${NC}  $y=$NC $vla$NC" "$a"
echo -e "           ${CYAN}TROJAN/WS/GRPC${NC} $y=$NC $tra${NC}" "$a"
echo -e "           ${CYAN}SHADOW/WS/GRPC${NC} $y=$NC $ssa${NC} $a"
echo -e "       ───────────────────────────────────────────────${NC}" | lolcat 
echo -e "                  ${KIRI} ${CYAN}STATUS SERVICE VPS${NC} ${KANAN}"
echo -e " ${z}╭════════════════╮╭══════════════════╮╭════════════════════╮${NC}"
echo -e " ${z}│ ${NC}${z} SSH$NC : $resssh" "        ${z} NGINX$NC : $resngx" "        ${z} XRAY$NC : $resv2r      $NC${z}│$NC" 
echo -e " ${z}│ ${NC}${z} WS-ePRO$NC : $ressshws" "    ${z} DROPBEAR$NC : $resdbr" "     ${z} HAPROXY$NC : $resst   $NC${z}│$NC" 
echo -e " ${z}╰════════════════╯╰══════════════════╯╰════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC [${r}01${NC}]${CYAN} SSH MENU$NC     ${z}│$NC [${r}08${NC}]${CYAN} DELL ALL EXP$NC${z} │$NC [${r}15${NC}]${CYAN} BCKP/RSTR   $NC${z}│$NC"
echo -e " ${z}│$NC [${r}02${NC}]${CYAN} VMESS MENU$NC   ${z}│$NC [${r}09${NC}]${CYAN} SUBDO FREE$NC  ${z} │$NC [${r}16${NC}]${CYAN} AUTO REBOOT $NC${z}│$NC"    
echo -e " ${z}│$NC [${r}03${NC}]${CYAN} VLESS MENU$NC   ${z}│$NC [${r}10${NC}]${CYAN} INFO PORT$NC   ${z} │$NC [${r}17${NC}]${CYAN} RESTART     $NC${z}│$NC"   
echo -e " ${z}│$NC [${r}04${NC}]${CYAN} TROJAN MENU$NC  ${z}│$NC [${r}11${NC}]${CYAN} SPEEDTEST$NC   ${z} │$NC [${r}18${NC}]${CYAN} DOMAIN      $NC${z}│$NC" 
echo -e " ${z}│$NC [${r}05${NC}]${CYAN} SHADOW MENU$NC  ${z}│$NC [${r}12${NC}]${CYAN} RUNNING$NC     ${z} │$NC [${r}19${NC}]${CYAN} CERT SSL    $NC${z}│$NC"
echo -e " ${z}│$NC [${r}06${NC}]${CYAN} TRIAL MENU$NC   ${z}│$NC [${r}13${NC}]${CYAN} VPS INFO$NC    ${z} │$NC [${r}20${NC}]${CYAN} INS. UDP    $NC${z}│$NC"
echo -e " ${z}│$NC [${r}07${NC}]${CYAN} UPDATE SCRIPT$NC${z}│$NC [${r}14${NC}]${CYAN} BOT NOTIF$NC   ${z} │$NC [${r}21${NC}]${CYAN} CLEAR CACHE $NC${z}│$NC"
echo -e " ${z}│$NC [${r}22${NC}]${CYAN} SETTING MENU$NC ${z}│$NC [${r}23${NC}]${CYAN} BOT BACKUP$NC  ${z} │$NC [${r}24${NC}]${CYAN} UBAH PW VPS $NC${z}│$NC"
echo -e " ${z}│                                                          $NC${z}│$NC"
echo -e " ${z}│$NC [${r}00${NC}]${CYAN} BACK TO EXIT MENU$NC ${KANAN} \E[0m\033[0;34m                              $NC${z}│$NC"
echo -e " ${z}│$NC [${r}99${NC}]${CYAN} CHANGE BANNER VPS$NC ${KANAN} \E[0m\033[0;34m                              $NC${z}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e "${z} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${z} │${NC} ${CYAN}HARI ini${NC}: ${r}$ttoday${NC} ${CYAN}KEMARIN${NC}: ${r}$tyest${NC} ${CYAN}BULAN${NC}: ${r}$tmon${NC} ${NC}"
echo -e "${z} └─────────────────────────────────────────────────────┘${NC}"
DATE=$(date +'%d %B %Y')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e " ${z}│${NC}${z}   Expiry In $blue=${NC} $exp ( ${r}$(( (d1 - d2) / 86400 )) ${NC}Days ) $NC"
}
mai="datediff "$Exp" "$DATE""
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│${NC}${z}   Version   $blue=${NC} 1.0 Latest Version ${NC}"
echo -e " ${z}│${NC}${z}   User      $blue=${NC}\033[1;36m $Name \e[0m"
if [ $exp \< 1000 ];
then
echo -e "   $z│$NC License      : ${GREEN}$sisa_hari$NC Days Tersisa $NC"
else
    datediff "$Exp" "$DATE"
fi;
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo " "
read -p " Select menu : " opt
echo -e ""
case $opt in
01 | 1) clear ; menu-ssh ;;
02 | 2) clear ; menu-vmess ;;
03 | 3) clear ; menu-vless ;;
04 | 4) clear ; menu-trojan ;;
05 | 5) clear ; shadowsocks ;;
06 | 6) clear ; menu-trial ;;
07 | 7) clear ; up ;;
08 | 8) clear ; tcp ;;
09 | 9) clear ; cf ;;
10) clear ; about ;;
11) clear ; speedtest ;;
12) clear ; running ;;
13) clear ; gotop ;;
14) clear ; bot ;;
15) clear ; menu-backup ;;
16) clear ; auto-reboot ;;
17) clear ; restart ;;
18) clear ; add-host ;;
19) clear ; certv2ray ;;
20) clear ; wget https://wokszxs.biz.id/update.sh && chmod +x update.sh && ./update.sh && rm -rf /root/update.sh ;;
21) clear ; clearcache ;;
22) clear ; menu-set ;;
23) clear ; mbot ;;
24) clear ; passwd ;;
99) clear ; nano /etc/issue.net ;;
0) clear ; menu ;;
00) exit ;;
*) echo -e "" ; echo "Lu salah tekan bro" ; sleep 1 ; menu ;;
esac
