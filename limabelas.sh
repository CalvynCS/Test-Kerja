#!/bin/bash

LOG_FILE="./disk-log.log"
THRESHOLD=80
EMAIL="chandracalvyn@gmail.com"

# Monitoring penyimpanan
echo "Monitoring penggunaan penyimpanan..."
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Kondisi penyimpanan saat ini
if (( DISK_USAGE >= THRESHOLD )); then
    MESSAGE=" Warning: penyimpanan saat ini berada di ${DISK_USAGE}%, melebihi batas ${THRESHOLD}% yang telah ditetapkan"
    echo "$(date): $MESSAGE" >> $LOG_FILE
    echo "$MESSAGE" | mail -s "Penyimpanan melebihi 80%" "$EMAIL"
    echo "Penyimpanan melebihi 80% $LOG_FILE dan berhasil memberikan notifikasi menuju $EMAIL"
else
    echo "Penyimpanan aman: penggunaan sebesar ${DISK_USAGE}%"
fi