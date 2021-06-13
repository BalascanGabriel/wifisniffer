#!/bin/bash

function wifi_analizer()
{

	echo 'Ati selectat Wifi_Analizer '
	./analizer.sh

}

function wifi_sniffing()
{

	echo 'Ati selectat Wifi_Sniffing '
	./sniffing.sh
}


PS3='Alegeti o optiune: '
options=("Wifi_Analizer" "Wifi_Sniffing" "Quit")
select opt in "${options[@]}"
do
    case $opt in 
	"Wifi_Analizer")
	wifi_analizer
	;;
	"Wifi_Sniffing")
	wifi_sniffing
	;;
	"Quit")
	break
	;;
	*) echo "invalid option $REPLY";;
    esac
done

