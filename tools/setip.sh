#!/bin/bash
# set centos ip scripts
# Author:chinayin
# Url http://git.oschina.net/chinayin/wdcp

Eth0file=ifcfg-eth0
#IPADDR=192.168.68.200
#GATEWAY=192.168.1.1

echo "THIS WILL CHANGE TO ${Eth0file}"
echo
read -p "IPADDR  = ? " IPADDR
read -p "GATEWAY = ? " GATEWAY
if [ -z "$IPADDR" ]; then	
	echo "PLEASE ENTER IPADDR!!"
	exit
elif [ -z "$GATEWAY" ]; then
	echo "PLEASE ENTER GATEWAY!!"
	exit
else
	echo "-------------------------------------------------------------"
	echo "IPADDR  = ${IPADDR}"	
	echo "GATEWAY = ${GATEWAY}"
fi
echo

echo "WRITE TO ${Eth0file}";

if [ ! -f /etc/sysconfig/network-scripts/${Eth0file} ];then
	echo "no ifcfg-eht0,downloading."
	wget -c http://git.oschina.net/chinayin/wdcp/raw/master/conf/sysconfig/network-scripts/${Eth0file}
fi

sed -i 's/\(ONBOOT=\).*/\1yes/g' /etc/sysconfig/network-scripts/${Eth0file}
sed -i "s/\(IPADDR=\).*/\1$IPADDR/g" /etc/sysconfig/network-scripts/${Eth0file}
sed -i "s/\(GATEWAY=\).*/\1$GATEWAY/g" /etc/sysconfig/network-scripts/${Eth0file}

echo "WEITE SUCCESS!"

echo "-------------------------------------------------------------"
cat /etc/sysconfig/network-scripts/${Eth0file}
echo "-------------------------------------------------------------"

read -p "DO YOU REALLY WANT TO RESTART NETWROK? (Y/N)" yn
if [ "$yn" == "Y" ] || [ "$yn" == "y" ]; then
	echo "SERVICE NETWORK RESTART..."
	service network restart
	echo "OK"
	exit
else
	exit
fi