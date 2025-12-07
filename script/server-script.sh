#!/bin/bash

# 1. Definisi Array (Daftar Server yang mau dicek)
# Anda bisa ganti IP/Domain di dalam tanda kutip ini
LIST_SERVER=("8.8.8.8" "1.1.1.1" "google.com" "192.168.1.1" "detik.com")

echo "======================================="
echo "   MONITORING SERVER (Total: ${#LIST_SERVER[@]})"
echo "======================================="

# 2. Loop (Perulangan)
# "Untuk setiap IP yang ada di dalam LIST_SERVER, lakukan perintah di bawah..."
for TARGET in "${LIST_SERVER[@]}"
do
    # Note: Gunakan -n 1 untuk Windows, ganti -c 1 jika di Linux Server
    # -w 1000 artinya: Timeout 1000ms (1 detik). Jadi kalau RTO tidak usah tunggu lama.
    ping -n 1 -w 1000 $TARGET > /dev/null 2>&1

    # 3. Cek Status
    if [ $? -eq 0 ]
    then
        echo -e "✅  $TARGET \t: ONLINE"
    else
        echo -e "❌  $TARGET \t: OFFLINE / RTO"
    fi
done

echo "======================================="
echo "Pengecekan Selesai."