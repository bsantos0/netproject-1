#!/bin/bash

#taget ping IP
terget="8.8.8.8"

echo "Memulai pengecekan koneksi ke $terget..."

#melakukan ping hanya 1 kali dengan menyembunyikan output (> /dev/null)
#Catatan : Untuk sistem berbasis Unix/Linux, gunakan 'ping -c 1'
#Sedangkan untuk Windows gunakan 'ping -n 1'
ping -n 1 $terget > /dev/null

if [ $? -eq 0 ]
then
    echo "Koneksi ke $terget berhasil!"
else
    echo "Koneksi ke $terget gagal!"
fi