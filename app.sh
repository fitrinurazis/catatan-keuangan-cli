#!/bin/bash

# Warna
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m" #No Color


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

# Fungsi: Edit Transaksi
edit_transaksi() {
    tampilkan_transaksi
    read -p "Masukkan indeks transaksi yang ingin diedit: " index
    if ! [[ "$index" =~ ^[0-9]+$ ]] || [[ -z "${jenis_transaksi[$index]}" ]]; then
        echo -e "${RED}Indeks tidak valid!${RESET}"
        return
    fi

    echo -e "${CYAN}Transaksi saat ini:${RESET}"
    echo -e "${YELLOW}Jenis: ${jenis_transaksi[$index]}, Nominal: Rp${nominal_transaksi[$index]}, Deskripsi: ${deskripsi_transaksi[$index]}${RESET}"

    read -p "Jenis baru (masuk/keluar): " jenis
    if [[ "$jenis" != "masuk" && "$jenis" != "keluar" ]]; then
        echo -e "${RED}Jenis tidak valid!${RESET}"
        return
    fi

    read -p "Nominal baru: " nominal
    if ! [[ "$nominal" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Nominal harus angka!${RESET}"
        return
    fi

    read -p "Deskripsi baru: " deskripsi
    if [[ -z "$deskripsi" ]]; then
        echo -e "${RED}Deskripsi tidak boleh kosong!${RESET}"
        return
    fi

    jenis_transaksi[$index]="$jenis"
    nominal_transaksi[$index]="$nominal"
    deskripsi_transaksi[$index]="$deskripsi"

    simpan_data
    echo -e "${GREEN}Transaksi berhasil diubah!${RESET}"
}


# Fungsi: Hapus Transaksi
hapus_transaksi() {
    tampilkan_transaksi
    read -p "Masukkan indeks transaksi yang ingin dihapus: " index
    if ! [[ "$index" =~ ^[0-9]+$ ]] || [[ -z "${jenis_transaksi[$index]}" ]]; then
        echo -e "${RED}Indeks tidak valid!${RESET}"
        return
    fi

    unset jenis_transaksi[$index]
    unset nominal_transaksi[$index]
    unset deskripsi_transaksi[$index]

    # Reindex array
    jenis_transaksi=("${jenis_transaksi[@]}")
    nominal_transaksi=("${nominal_transaksi[@]}")
    deskripsi_transaksi=("${deskripsi_transaksi[@]}")

    simpan_data
    echo -e "${GREEN}Transaksi berhasil dihapus!${RESET}"
}

total_saldo() {
    total_masuk=0
    total_keluar=0

    for i in "${!jenis[@]}"; do
        if [ "${jenis[$i]}" == "masuk" ]; then
            ((total_masuk+=jumlah[$i]))
        else
            ((total_keluar+=jumlah[$i]))
        fi
    done

    saldo=$((total_masuk - total_keluar))

    echo -e "${GREEN}------------------${RED}-----------------${CYAN}-----------------${RESET}"
    printf  "${GREEN}| %-15s| ${RED}%-15s| ${CYAN}%-15s|\n" "Pemasukan" "Pengeluaran" "Saldo"
    echo -e "${GREEN}------------------${RED}-----------------${CYAN}-----------------${RESET}"
    printf  "${GREEN}| Rp%-13s| ${RED}Rp%-13s| ${CYAN}Rp%-13s|\n" "$total_masuk" "$total_keluar" "$saldo"
    echo -e "${GREEN}------------------${RED}-----------------${CYAN}-----------------${RESET}"
}


# Menu Utama
while true; do
    echo -e "\n${CYAN}===== Aplikasi Catatan Keuangan =====${RESET}"
    echo -e "${YELLOW}Selamat datang di aplikasi catatan keuangan Anda.${RESET}"
    echo ""
    total_saldo
    echo ""
    echo "1. Tambah Transaksi"
    echo "2. Tampilkan Semua Transaksi"
    echo "3. Edit Transaksi"
    echo "4. Hapus Transaksi"
    echo "5. Keluar"
    read -p "Pilih opsi [1-5]: " pilihan

    case $pilihan in
        1) tambah_transaksi ;;
        2) tampilkan_transaksi ;;
        3) edit_transaksi ;;
        4) hapus_transaksi ;;
        5) echo -e "${YELLOW}Terima kasih!${RESET}"; break ;;
        *) echo -e "${RED}Opsi tidak valid!${RESET}" ;;
    esac
done
