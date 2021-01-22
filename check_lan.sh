#!/bin/bash

clear
echo "Check lan card"
echo -e "\e[37m\e[44meth0 \e[0m" && ifconfig eth0 | egrep -w 'inet addr|dropped'
echo -e "\e[37m\e[44meth0.6 \e[0m" && ifconfig eth0.6 | egrep -w 'inet addr|dropped'
echo -e "\e[37m\e[44meth1 \e[0m" && ifconfig eth1 | egrep -w 'inet addr|dropped'
echo -e "\e[32m\e[32mLINK\e[0m" && ethtool eth0 | grep detected
echo -e "\e[32m\e[32mON-LINE\e[0m" && arp | awk '{if ($2=="ether") print $1}' | awk -F- '{if ($4==150)print $2,$3,$4,$5}' | sed 's/ /./g'

echo "Check service status"
echo -e "\e[32m\e[32mTSD_server\e[0m" && service tsdserver status
echo -e "\e[32m\e[32mDHCP\e[0m" && service dhcpd status | iconv -f UTF-8 -t 1251
echo -e "\e[32m\e[32mAuthorization_on_TSD\e[0m" && cat /var/log/tsdserver/acces.log | grep pass | tail -5
