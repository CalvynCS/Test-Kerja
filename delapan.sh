#!/bin/bash

USERNAME="root"
IP_TARGET="x.x.x.x"

ssh -i ./calvyn -o BatchMode=yes -o ConnectTimeout=10 "$USERNAME@$IP_TARGET" "exit"

if [ $? -eq 0 ]; then
    echo "Koneksi SSH ke server $USERNAME@$IP_TARGET BERHASIL."
else
    echo "Koneksi SSH ke server $USERNAME@$IP_TARGET GAGAL."
fi