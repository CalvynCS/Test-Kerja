#!/bin/bash

SOURCE_LOG="./auto_update.log"

echo "========================================" >> $SOURCE_LOG
echo "Starting update at $(date)" >> $SOURCE_LOG
echo "========================================" >> $SOURCE_LOG

sudo apt update -y >> $SOURCE_LOG 2>&1

echo "Update completed at $(date)" >> $SOURCE_LOG
echo "========================================" >> $SOURCE_LOG