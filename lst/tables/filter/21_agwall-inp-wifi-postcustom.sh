#!/bin/sh

ipv6=False
#ipv6=True
debug=''
#debug='echo '

ipt=/system/bin/iptables

if [ $ipv6 == True ]; then
  ip6t=/system/bin/ip6tables
fi

# uid wifi dhcp

$debug $ipt -A agwall-inp-wifi-postcustom -m owner --uid-owner 1014 -j RETURN
$debug $ipt -A agwall-inp-wifi-postcustom -m owner --uid-owner 1010 -j RETURN
$debug $ipt -A agwall-inp-wifi-postcustom -j agwall-inp-wifi-fork

if [ $ipv6 == True ]; then
$debug $ip6t -A agwall-inp-wifi-postcustom -j agwall-inp-wifi-fork
fi

