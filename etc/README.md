## Configuration files for Barge RPi

### Activate Wireless LAN on Board

```
[bargee@barge-rpi ~]$ sudo -i
[root@barge-rpi ~]# cat interfaces.wlan0 >> /etc/network/interfaces
```

And also you have to configure your Wi-Fi access point information in `/etc/ wpa_supplicant.conf` to connect the Wi-Fi network.
