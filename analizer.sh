#!/bin/bash

function show_menu()
{
 echo "Scrieti optiunea dorita"
 echo "1. Afisati retelele wifi"
 echo "2. Afisati ip-urile si mac-urile dispozitivelor conectate la router"

}


function show_ip_mac()
{
 echo "1. Ati selectat optiunea show_ip"
 echo "Introduceti adresa ip impreuna cu masca ex(192.1.1.1/24): "
 read ip_mask
 sudo python3 show_ip_mac.py --target $ip_mask
}

function show_wifi()
{
 echo "2. Ati selectat optiunea show_wifi"
 #sudo python3 show_wifi.py
 sudo nmcli dev wifi
}

PS3='Alegeti o optiune: '
options=("Show_IP" "Show_Wifi" "Quit")
select opt in "${options[@]}"
do
    case $opt in
	"Show_IP")
	show_ip_mac
	;;
	"Show_Wifi")
	show_wifi
	;;
	"Quit")
	break
	;;
	*) echo "optiune invalida $REPLY";;
    esac
done
