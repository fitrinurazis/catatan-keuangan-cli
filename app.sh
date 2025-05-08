#!/bin/bash

# Warna
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
NC="\e[0m" #No Color


# Array penyimpanan data
declare -a jenis_transaksi
declare -a nominal_transaksi
declare -a deskripsi_transaksi

# Fungsi: Tambah Transaksi
tambah_transaksi() {
    echo -e "${CYAN}=== Tambah Transaksi ===${RESET}"
    read -p "Jenis (masuk/keluar): " jenis
    if [[ "$jenis" != "masuk" && "$jenis" != "keluar" ]]; then
        echo -e "${RED}Jenis transaksi tidak valid!${RESET}"
        return
    fi

    read -p "Nominal: " nominal
    if ! [[ "$nominal" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Nominal harus berupa angka!${RESET}"
        return
    fi

    read -p "Deskripsi: " deskripsi
    if [[ -z "$deskripsi" ]]; then
        echo -e "${RED}Deskripsi tidak boleh kosong!${RESET}"
        return
    fi

    jenis_transaksi+=("$jenis")
    nominal_transaksi+=("$nominal")
    deskripsi_transaksi+=("$deskripsi")
    simpan_data
    echo -e "${GREEN}Transaksi berhasil ditambahkan!${RESET}"
}

# Fungsi: Tampilkan Semua Transaksi
tampilkan_transaksi() {
    echo -e "${CYAN}=== Daftar Transaksi ===${RESET}"
    if [[ ${#jenis_transaksi[@]} -eq 0 ]]; then
        echo -e "${YELLOW}Belum ada transaksi.${RESET}"
        return
    fi

    for ((i=0; i<${#jenis_transaksi[@]}; i++)); do
        echo -e "${YELLOW}[$i] Jenis: ${jenis_transaksi[$i]}, Nominal: Rp${nominal_transaksi[$i]}, Deskripsi: ${deskripsi_transaksi[$i]}${RESET}"
    done
}

# Menu Utama
while true; do
    echo -e "\n${CYAN}===== Aplikasi Catatan Keuangan =====${NC}"
    echo "1. Tambah Transaksi"
    echo "2. Tampilkan Semua Transaksi"
    echo "3. Edit Transaksi"
    echo "4. Hapus Transaksi"
    echo "5. Keluar"
    read -p "Pilih opsi [1-5]: " pilihan

    case $pilihan in
        1) tambah_transaksi ;;
        2) tampilkan_transaksi ;;
    esac
done
