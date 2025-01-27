#!/bin/bash

#gunakan akses root
sudo su

INTERFACE="eth0"
IP_ADDRESS="192.168.1.100"
GATEWAY="192.168.1.1"
DNS="8.8.8.8,8.8.4.4"
NETPLAN_CONFIG="/etc/netplan/01-netcfg.yaml"

#Konfigurasi netplan
echo "Membuat konfigurasi netplan $INTERFACE..."
cat > $NETPLAN_CONFIG <<EOL
network:
  version: 2
  renderer: networkd
  ethernets:
    $INTERFACE:
      dhcp4: false
      addresses:
        - $IP_ADDRESS
      gateway4: $GATEWAY
      nameservers:
        addresses:
          - $(echo $DNS_SERVERS | sed "s/,/\n          - /g")
EOL

#Membuat netplan
echo "Menerapkan konfigurasi netplan ..."
netplan generate

#Check koneksi
echo "Melakukan pengecekan network..."
ping -c 4 8.8.8.8 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Network tersambung. Konfigurasi berhasil!"
else
    echo "Network tidak tersambung. Pastikan konfigurasi file sudah sesuai."
    exit 1
fi