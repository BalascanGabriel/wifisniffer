#!/bin/bash

function show_menu()
{
 echo "Scrieti optiunea dorita"
 echo "1. Afisarea pachetelor din retea"
 echo "2. Blocarea comunicatiiei a unui dispozitiv"
 echo "3. Spargerea parolei router-ului"
}


function show_packet()
{
 
 echo "1. Ati selectat show_packet"
 sudo python3 sniffing1.py

}


function block_device()
{

 echo "2. Ati selectat block_devie"
 echo "Introduceti adresa ip impreuna cu masca ex(192.1.1.1/24): "
 read ip_mask
 sudo python3 show_ip_mac.py --target $ip_mask
 sudo python3 block_device.py

}

function cracker()
{
 echo "3. Ati selectat cracker"
 sudo python3 cracker1.py

}

PS3='Alegeti o optiune: '
options=("Show_Packet" "Block_Device" "Cracker" "Quit")
select opt in "${options[@]}"
do
    case $opt in
	"Show_Packet")
	show_packet
	;;
	"Block_Device")
	block_device
	;;
	"Cracker")
	cracker
	;;
	"Quit")
	break
	;;
	*) echo "invalid option $REPLY";;
    esac
done
