#!/bin/bash

# Warna
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
NC="\e[0m" #No Color

# Menu Utama
while true; do
    echo -e "\n${CYAN}===== Aplikasi Catatan Keuangan =====${NC}"
    echo "1. Tambah Transaksi"
    echo "2. Tampilkan Semua Transaksi"
    echo "3. Edit Transaksi"
    echo "4. Hapus Transaksi"
    echo "5. Keluar"
    read -p "Pilih opsi [1-5]: " pilihan
done
