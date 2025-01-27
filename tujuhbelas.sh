#!/bin/bash

#Aktifkan UFW
sudo ufw enable

#Mengizinkan semua Outbond Rules
sudo ufw default allow outgoing

#Mengizinkan inbound rules Port 22, 80 dan 443
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443

#ini membuat server hanya memberikan akses inbound terhadap port 22, 80 dan 443