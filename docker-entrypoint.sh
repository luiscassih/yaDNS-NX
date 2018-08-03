#!/bin/bash
if [ $# -lt 1 ]; then
	echo "Please set the local IP"
	exit 1
fi
sed -i "s/REPLACEIP/$1/g" /etc/bind/zones/net.nintendo.zone
sed -i "s/REPLACEIP/$1/g" /etc/bind/zones/net.nintendowifi.zone
named -c /etc/bind/named.conf
nginx -g "daemon off;"