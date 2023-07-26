#!/bin/bash
# pewarna hidup
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
clear
echo " "
echo " "
echo " "
read -p "Masukan Nama Yang Mau Di Lock: " username
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
# proses mengganti passwordnya
passwd -l $username
clear
  echo " "
  echo " "
  echo " "
  echo "-----------------------------------------------"
  echo -e "Username ${blue}$username${NC} Successfully ${red}LOCKED!${NC}."
  echo -e "Akses Login to username ${blue}$username${NC} has been locked."
  echo "-----------------------------------------------"
else
echo "Username not found on your server."
    exit 1
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu
