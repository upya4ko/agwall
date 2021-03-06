#!/bin/sh

ipv6=False
#ipv6=True
debug=''
#debug='echo '

ipt=/system/bin/iptables

if [ $ipv6 == True ]; then
  ip6t=/system/bin/ip6tables
fi

#$debug $ipt -A agwall-reject -j NFLOG --nflog-prefix  "{AGL}" --nflog-group 40
$debug $ipt -A agwall-inp-reject -j LOG --log-prefix  "{AGLinp}" 
$debug $ipt -A agwall-inp-reject -j REJECT --reject-with icmp-port-unreachable

if [ $ipv6 == True ]; then
#$debug $ip6t -A agwall-reject -j NFLOG --nflog-prefix  "{AGL}" --nflog-group 40
$debug $ip6t -A agwall-inp-reject -j LOG --log-prefix  "{AGLinp}" 
$debug $ip6t -A agwall-inp-reject -j REJECT --reject-with icmp-port-unreachable
fi

