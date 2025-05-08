#!/bin/bash

#Warna Teks
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
RESET="\033[0m"

#Deklarasi array
declare -a riwayat_tebakan

#fungsi untuk menampilkan judul
function show_title() {
    echo -e "${CYAN}======================"
    echo -e " Tebak Angka"
    echo -e "======================${RESET}"
}

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

#function game
function play_game() {
    target=$((RANDOM % 100 +1))
    chance = 0

    echo -e "${YELLOW}Saya telah memilih angka antara 1 - 100. Coba tebak! ${RESET}"

    while true; do
        read -p "Masukkan tebakan mu: " tebakan
        validasi_input "$tebakan"
        status=$?

        if [[$status -eq 1]]; then
            echo -e "${RED}Input tidak valid. Masukkan angka saja.${RESET}"
            continue
        elif [[$status -eq 2]]; then
            echo -e "${RED}Angka harus diantara 1 sampai 100.${RESET}"
            continue
        fi

        show_history+=("$tebakan")
        ((chance++))

        if ((tebakan < target)); then
            echo -e "${YELLOW}Terlalu kecil! Coba lagi.${RESET}"
        elif ((tebakan > target)); then
            echo -e "${GREEN}Selamat! anda menebak dengan benar dalam $chance percobaan.${RESET}"
            show_history
            break
        fi
    done
}
