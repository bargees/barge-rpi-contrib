## Utilities for Barge RPi

### Partition and Format a SD Card

Right after you write the Barge RPi image to a SD card, the entire filesystem will be on a RAM. So it is very limited and not persistent.

To use the rest of the SD card as a persistent storage, you need to partition and format the SD card. 

To partition the SD card,

```
[bargee@barge-rpi ~]$ sudo ./partition.sh
```

If you write the Barge RPi at the very first time, you need to format it as well.  
If not, you can use the partition you formated before without formating. But if you want to erase the data in the partition, you can format it again.

```
[bargee@barge-rpi ~]$ sudo ./format.sh
```

And then reboot,

```
[bargee@barge-rpi ~]$ sudo reboot
```

### Mount a Remote Disk by NFS

You may want to mount a remote disk on Raspberry Pi.

To do so,

```
[bargee@barge-rpi ~]$ sudo ./mount.sh <server-ip>:<exported-dir> <local-mount-point>
```

ex.) `sudo ./mount.sh 192.168.1.4:/Users/ailispaw /mnt/nfs`  
`/Users/ailispaw` is supposed to be exported on the NFS server with `192.168.1.4`.

### Activate bluetooth

```
[bargee@barge-rpi ~]$ sudo pkg install bluez5_utils
[bargee@barge-rpi ~]$ sudo ./bluetooth.sh start
```
