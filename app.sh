#!bin/bash

#Warna Teks
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
RESET="\033[0m"

#Deklarasi array
declare -a riwayat_tebakan

#Fungsi untuk validasi input angka
function validasi_input() {
    local input=$1
    if [[!$input =~ ^[0-9]+$]]; then
        return 1
    elif ((input < 1 || input > 100)); then
        return 2
    else
        return 0
    fi
}
