import threading, os, time, random
from scapy.all import *

def hopper(iface):
    n = 1
    stop_hopper = False
    for i in range (0,100):
        time.sleep(0.10)
        os.system('iwconfig %s channel %d' % (iface, n))
        dig = int(random.random() * 14)
        if dig != 0 and dig != n:
            n = dig

F_bssids = []    # Found BSSIDs
def findSSID(pkt):
    if pkt.haslayer(Dot11Beacon):
       if pkt.getlayer(Dot11).addr2 not in F_bssids:
           F_bssids.append(pkt.getlayer(Dot11).addr2)
           ssid = pkt.getlayer(Dot11Elt).info
           if ssid == '' or pkt.getlayer(Dot11Elt).ID != 0:
               print ("Hidden Network Detected")
           print ("Network Detected: %s" % (ssid))

    #os.system("airmon-ng start wlan1")
interface = "wlan1mon"
thread = threading.Thread(target=hopper, args=(interface, ), name="hopper")
thread.daemon = True
thread.start()
sniff(iface=interface, prn=findSSID)
