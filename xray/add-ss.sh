#!/bin/bash
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
domain=$(cat /etc/xray/domain)
PUB=$(cat /etc/slowdns/server.pub)
CITY=$(cat /etc/xray/city)
NS=$(cat /etc/xray/dns)
AKUN="AKUN SHADOWSOCKS"
TIMES="10"
CHATID="-922222061"
KEY="6383900821:AAGrdOhs_cJ9ILZUUofrrfHyQLK2r0yMkcU"
URL="https://api.telegram.org/bot$KEY/sendMessage"
hariini=`date -d "0 days" +"%Y-%m-%d"`
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
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6281215360549"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " \e[1;97;101m      CREATE SHADOWSOCKS ACCOUNT     \e[0m"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

  read -rp "User: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m     CREATE SHADOWSOCKS ACCOUNT    \e[0m"
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press [ Enter ] to back on menu shadowsocks"
    shadowsocks
  fi
done

cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
read -p "Limit User (GB): " Quota
read -p "Owner   : " OWNER

#####BOT-TRX
TRX="
<code>INFO MASKU -Transaksi</code>
<code>────────────────────</code>
<b>  ⚠️TRANSAKSI SHADOWSOCKS ⚠️      </b>
<code>────────────────────</code>
<code>🌟Owner   : $OWNER</code>
<code>🌟IP      : $IP$(curl -sS ifconfig.me)</code>
<code>🌟User    : $user</code>
<code>🌟Passwd  : $Pass</code>
<code>🌟Limit   : $Quota</code>
<code>🌟Detail  : $AKUN</code>
<code>🌟Durasi  : $masaaktif days</code>
<code>🌟Server  : $domain</code>
<code>────────────────────</code>
<i>Notifikasi Via YogzBot</i>
<b>Tele : @YSSHstore</b>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TRX&parse_mode=html" $URL
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#ssws$/a\#ss# '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#ssgrpc$/a\#ss# '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
echo $cipher:$uuid >/tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 >/tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
shadowsockslink="ss://${shadowsocks_base64e}@${domain}:443?path=/ss-ws&security=tls&encryption=none&type=ws#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"
systemctl reload xray
rm -rf /tmp/log
rm -rf /tmp/log1
cat >/var/www/html/ss-$user.txt <<-END
=========================
P R O J E C T  O F
=========================
 https://github.com/ngapain?
=========================
 Format Shadowsocks WS (CDN)
=========================

{
 "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "$domain"
        },
        "wsSettings": {
          "headers": {
            "Host": "$domain"
          },
          "path": "/ss-ws"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
 }

_______________________________
 Format Shadowsocks gRPC
_______________________________


{
    "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "grpcSettings": {
          "multiMode": true,
          "serviceName": "ss-grpc"
        },
        "network": "grpc",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "$domain"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}


_______________________________
 Link Shadowsocks Account
_______________________________
Link TLS : ss://${shadowsocks_base64e}@${domain}:443?path=/ss-ws&security=tls&encryption=none&type=ws#${user}"
_______________________________
Link gRPC : ss://${shadowsocks_base64e}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"
_______________________________



END
shadowsockslink="ss://${shadowsocks_base64e}@${domain}:443?path=/ss-ws&security=tls&encryption=none&type=ws#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"

TEXT="
<code>──────────────────────────</code>
<code>   SUCCES SHADOWSOCKS ACCOUNT</code>
<code>──────────────────────────</code>
<code>Remarks           : ${user}</code>
<code>Domain            : ${domain}</code>
<code>Location          : $CITY</code>
<code>User Quota        : ${Quota} GB</code>
<code>Port TLS          : 443</code>
<code>Port GRPC         : 443</code>
<code>Cipers            : aes-128-gcm</code>
<code>User ID           : ${uuid}</code>
<code>AlterId           : 0</code>
<code>Security          : auto</code>
<code>Network           : WS/gRPC</code>
<code>Path WS           : /ss-ws</code>
<code>Path GRPC         : /ss-grpc</code>
<code>ServiceName       : shadowsocks-grpc</code>
<code>──────────────────────────</code>
<code>Link TLS          :</code> 
<code>ss://${shadowsocks_base64e}@${domain}:443?path=/ss-ws&security=tls&encryption=none&type=ws#${user}</code>
<code>───────────────────────────</code>
<code>Link NTLS         :</code> 
<code>$ss://${shadowsocks_base64e}@${domain}:443?path=/ss-ws&security=tls&encryption=none&type=ws#${user}</code>
<code>───────────────────────────</code>
<code>Format OpenClash  :</code> 
https://${domain}:81/trojan-$user.txt
<code>──────────────────────────</code>
<code>Aktif Selama   : $masaaktif Hari</code>
<code>Dibuat Pada    : $tnggl</code>
<code>Berakhir Pada  : $expe</code>
<code>───────────────────────────</code>
"
systemctl restart xray
systemctl restart nginx
service cron restart
if [ ! -e /etc/shadowsocks ]; then
  mkdir -p /etc/shadowsocks
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/shadowsocks/${user}
fi
DATADB=$(cat /etc/shadowsocks/.shadowsocks.db | grep "#^ss#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/shadowsocks/.shadowsocks.db
fi
echo "#ss# ${user} ${exp} ${uuid} ${Quota}" >>/etc/shadowsocks/.shadowsocks.db

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear

echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m           SUCCES CREAT SHADOWSOCKS ACCOUNT          \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "Location       : $CITY"
echo -e "User Quota     : ${Quota} GB"
echo -e "User ID        : ${uuid}"
echo -e "Port TLS       : 443"
echo -e "Port  GRPC     : 443"
echo -e "Cipers         : aes-128-gcm"
echo -e "Network        : ws or grpc"
echo -e "Path           : /ss-ws or /ss-grpc"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link TLS       : ${shadowsockslink}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link gRPC      : ${shadowsockslink1}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link JSON      : https://${domain}:81/ss-$user.txt"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Aktif Selama   : $masaaktif Hari"
echo -e "Dibuat Pada    : $tnggl"
echo -e "Berakhir Pada  : $expe"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"

menu
