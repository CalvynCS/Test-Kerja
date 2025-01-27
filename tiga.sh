#!/bin/bash

SOURCE_FOLDER="."

printf "%-20s %-10s %-10s %-10s\n" "FILE NAME" "LINES" "WORDS" "CHARS"
printf "%-20s %-10s %-10s %-10s\n" "=========" "=====" "=====" "====="

#wc -lwc "$SOURCE_FOLDER"

for file in "$SOURCE_FOLDER"/*; do
    if [ -f "$file" ]; then
        # Jalankan wc untuk mendapatkan jumlah baris, kata, dan karakter
        result=$(wc -lwc "$file")
        lines=$(echo "$result" | awk '{print $1}')
        words=$(echo "$result" | awk '{print $2}')
        chars=$(echo "$result" | awk '{print $3}')
        filename=$(basename "$file")

        # Tampilkan hasil dalam format tabel
        printf "%-20s %-10s %-10s %-10s\n" "$filename" "$lines" "$words" "$chars"
    fi
done