#!/bin/sh

alias echo_date1='echo $(date +%Y年%m月%d日\ %X)'
export KSROOT=/jffs/koolshare
source $KSROOT/scripts/base.sh
eval `dbus export ss_`
date=`echo_date1`
LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")


get_china_status(){
	wget -4 --spider --quiet --tries=2 --timeout=2 www.baidu.com
	if [ "$?" == "0" ]; then
		log2='【'$LOGTIME'】 Testing www.baidu.com. Succed!'
	else
		log2='【'$LOGTIME'】 Testing www.baidu.com. Failed! Please check WAN settings.'
	fi
}

get_foreign_status(){
	wget -4 --spider --quiet --tries=2 --timeout=2 www.google.com.tw
	if [ "$?" == "0" ]; then
		log1='【'$LOGTIME'】 Testing www.googel.com.tw. Succed!'
		log3='No need to restart shadowsocks.'
	else
		log1='【'$LOGTIME'】 Testing www.googel.com.tw. failed! Restarting shadowsocks.' 
		sh /jffs/koolshare/scripts/ss_config.sh start
		log3='Shadowsocks restarted.'
	fi
}

get_china_status
get_foreign_status

echo $log1
echo $log2
echo $log3
