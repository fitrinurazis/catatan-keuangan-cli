# Catatan Keuangan CLI

Aplikasi command-line interface (CLI) sederhana untuk mencatat dan mengelola keuangan pribadi.

## Deskripsi

Catatan Keuangan CLI adalah aplikasi berbasis terminal yang memungkinkan pengguna untuk mencatat, menampilkan, mengedit, dan menghapus transaksi keuangan. Aplikasi ini menyimpan data transaksi dalam format teks sederhana dan menyediakan ringkasan saldo keuangan.

## Fitur

- Menambahkan transaksi pemasukan dan pengeluaran
- Menampilkan daftar semua transaksi
- Mengedit transaksi yang sudah ada
- Menghapus transaksi
- Menampilkan ringkasan saldo (total pemasukan, pengeluaran, dan saldo akhir)
- Penyimpanan data persisten dalam file teks

## Persyaratan

- Bash shell (Linux, macOS, atau Windows dengan WSL/Git Bash)

## Instalasi

1. Clone repositori ini:

```bash
git clone https://github.com/fitrinurazis/catatan-keuangan-cli.git
```

2. Masuk ke direktori aplikasi:

```bash
cd catatan-keuangan-cli
```

3. Berikan izin eksekusi pada file app.sh:

```bash
chmod +x app.sh
```

## Penggunaan

Jalankan aplikasi dengan perintah:

```bash
./app.sh
```

### Menu Utama

Aplikasi menampilkan menu utama dengan opsi berikut:

1. Tambah Transaksi
2. Tampilkan Semua Transaksi
3. Edit Transaksi
4. Hapus Transaksi
5. Keluar

### Tambah Transaksi

Untuk menambahkan transaksi baru:

- Pilih jenis transaksi (masuk/keluar)
- Masukkan nominal (dalam angka)
- Berikan deskripsi transaksi

### Tampilkan Transaksi

Menampilkan daftar semua transaksi yang telah dicatat dengan format:

- Indeks
- Jenis transaksi
- Nominal
- Deskripsi

### Edit Transaksi

Untuk mengedit transaksi yang sudah ada:

- Pilih indeks transaksi yang ingin diedit
- Masukkan data baru untuk transaksi tersebut

### Hapus Transaksi

Untuk menghapus transaksi:

- Pilih indeks transaksi yang ingin dihapus

## Struktur Data

Data transaksi disimpan dalam file `data.txt` dengan format:

```
jenis|nominal|deskripsi
```

## Kontribusi

Kontribusi selalu diterima. Untuk berkontribusi:

1. Fork repositori
2. Buat branch fitur baru
3. Commit perubahan
4. Push ke branch
5. Buat Pull Request

## Lisensi

[MIT License](LICENSE)

## Kontak

Fitri Nur Azis - [GitHub](https://github.com/fitrinurazis)
