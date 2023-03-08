#!/bin/bash

# edit package manager configuration file
sudo sed -i 's/^deb/#deb/g' /etc/apt/sources.list
sudo echo 'deb http://http.kali.org/kali kali-last-snapshot main contrib non-free' >> /etc/apt/sources.list

# install necessary drivers for Realtek 8814au chipset
sudo apt update
sudo apt install -y realtek-rtl8814au-dkms

sudo airmon-ng start wlan0

# start capturing Wi-Fi traffic using airodump-ng
sudo airodump-ng wlan0

# start capturing Wi-Fi traffic and save in pcap format for Wireshark
sudo airodump-ng wlan0 --write output --output-format pcap
