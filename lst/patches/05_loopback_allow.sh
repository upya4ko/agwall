#!/bin/sh

#ipv6=False
ipv6=True
debug=''
#debug='echo '

ipt=/system/bin/iptables

if [ $ipv6 == True ]; then
  ip6t=/system/bin/ip6tables
fi

for chain in agwall-out agwall-inp ; do
  $debug $ipt -A $chain -i lo -j ACCEPT 
  $debug $ipt -A $chain -o lo -j ACCEPT 
  
  $debug $ipt -A $chain -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT

  if [ $ipv6 == True ]; then
    $debug $ip6t -A $chain -i lo -j ACCEPT
    $debug $ip6t -A $chain -o lo -j ACCEPT

    $debug $ip6t -A $chain -s ::1 -d ::1 -j ACCEPT
  fi
done


#$IPTABLES -A OUTPUT -o lo -j ACCEPT
#$IP6TABLES -A OUTPUT -o lo -j ACCEPT

# Anti-Spoofing on loopback ::1 & the unique local address fe80::/1 
#WLAN_IF="wlan0"
#$IP6TABLES -A INPUT ! -i lo -s ::1/128 -j DROP
#$IP6TABLES -A INPUT -i $WLAN_IF -s fe80::/1 -j DROP
#$IP6TABLES -A FORWARD -s ::1/128 -j DROP
#$IP6TABLES -A FORWARD -i $WLAN_IF -s fe80::/1 -j DROP


