# Supplements to Barge RPi

### Activate Audio

```
[bargee@barge-rpi ~]$ sudo -i
[root@barge-rpi ~]# addgroup bargee audio
[root@barge-rpi ~]# mkdir /boot
[root@barge-rpi ~]# mount /dev/mmcblk0p1 /boot
[root@barge-rpi ~]# echo "dtparam=audio=on" >> /boot/config.txt
[root@barge-rpi ~]# reboot
```

```
[bargee@barge-rpi ~]$ sudo pkg install alsa-utils
[bargee@barge-rpi ~]$ amixer cset numid=3 1        # 1 for built-in output
[bargee@barge-rpi ~]$ aplay /usr/share/sounds/alsa/Front_Center.wav
```
