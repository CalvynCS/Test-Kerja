#!/bin/bash

BACKUP_DIR="."
RETENTION_DAYS=7

find "$BACKUP_DIR" -type f -mtime +"$RETENTION_DAYS" -exec rm{} \;
echo "Data Backup lebih dari 7 hari telah dihapus"