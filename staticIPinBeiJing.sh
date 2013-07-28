#/bin/bash

/usr/bin/ifconfig wlp3s0 down
/usr/bin/ifconfig enp5s0 down
/usr/bin/link set dev enp5s0 up
/usr/bin/wpa_supplicant -B -i enp5s1 -c /etc/wpa_supplicant.conf
/usr/bin/ip addr add 192.168.1.21/24 dev enp5s0
/usr/bin/ip route add default via 192.168.1.1

/usr/bin/ip addr flush dev enp5s0
/usr/bin/ip link set dev enp5s0 down

/usr/bin/ifconfig enp5s0 up
/usr/bin/rm -f /etc/resolv.conf
touch /etc/resolv.conf
echo "nameserver 192.168.1.1" > /etc/resolv.conf


