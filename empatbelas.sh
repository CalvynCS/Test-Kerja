#!/bin/bash

SOURCE_LOG="./cpu_log.log"
INTERVAL="1"
DURATION="60"
THRESHOLD=75

#Install sysstat terlebih dahulu
sudo apt install sysstat

echo "Proses monitoring CPU dalam $DURATION detik..."
CPU_USAGE=$(mpstat $INTERVAL $DURATION | awk '/Average:/ && $NF ~ /[0-9.]+/ {print 100 - $NF}')

#Jika CPU melebihi nilai Threshold yang telah ditentukan
if (( $(echo "$CPU_USAGE >= $THRESHOLD" | bc -l) )); then
    echo "$(date): Peringatan! Dalam 1 menit penggunaan CPU berada di angka ${CPU_USAGE}%, melebihi batas aman ${THRESHOLD}% yang telah ditetapkan" >> $SOURCE_LOG
    echo "Penggunaan CPU telah dimasukkan kedalam file log $SOURCE_LOG"
else
    echo "Penggunaan CPU: ${CPU_USAGE}%"
fi