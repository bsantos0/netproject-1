#!/bin/bash

# --- LIST WEBSITES ---
# Kita ganti target jadi Website karena kita akan pakai metode HTTP Check
# (Hapus 8.8.8.8 karena itu DNS Server, tidak punya halaman web)
LIST_SERVER=("google.com" "www.detik.com" "kumparan.com" "microsoft.com" "outlook.office365.com")

echo "======================================="
echo "   MONITORING WEB SERVICE (HTTP CHECK)"
echo "======================================="

for TARGET in "${LIST_SERVER[@]}"
do
    # PERUBAHAN UTAMA DI SINI:
    # curl -s : Silent (jangan tampilkan progress bar)
    # --head  : Cuma ambil judul halamannya saja (biar cepat)
    # --request GET : Minta data
    
    if curl -s --head --request GET "https://$TARGET" > /dev/null; then
        echo -e "✅  $TARGET \t: ONLINE (Web Bisa Diakses)"
    else
        echo -e "❌  $TARGET \t: DOWN (Web Tidak Bisa Diakses)"
    fi
done

echo "======================================="
echo "Pengecekan Selesai."