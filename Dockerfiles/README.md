## Dockerfiles for Barge RPi (arm64v8)

### alsa-utils

To activate audio on Raspberry Pi,

```
[bargee@barge-rpi ~]$ sudo -i
[root@barge-rpi ~]# addgroup bargee audio
[root@barge-rpi ~]# mkdir /boot
[root@barge-rpi ~]# mount /dev/mmcblk0p1 /boot
[root@barge-rpi ~]# echo "dtparam=audio=on" >> /boot/config.txt
[root@barge-rpi ~]# reboot
```

And then,

```
[bargee@barge-rpi ~]$ docker build -t ailispaw/alsa-utils:arm64v8 .
```

Or just run the image from Docker Hub,

```
[bargee@barge-rpi ~]$ docker run -it --rm --device /dev/snd:/dev/snd ailispaw/alsa-utils:arm64v8
[root@5b83bae544df /]# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: ALSA [bcm2835 ALSA], device 0: bcm2835 ALSA [bcm2835 ALSA]
  Subdevices: 8/8
  Subdevice #0: subdevice #0
  Subdevice #1: subdevice #1
  Subdevice #2: subdevice #2
  Subdevice #3: subdevice #3
  Subdevice #4: subdevice #4
  Subdevice #5: subdevice #5
  Subdevice #6: subdevice #6
  Subdevice #7: subdevice #7
card 0: ALSA [bcm2835 ALSA], device 1: bcm2835 ALSA [bcm2835 IEC958/HDMI]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
[root@5b83bae544df /]# amixer cset numid=3 1
numid=3,iface=MIXER,name='PCM Playback Route'
  ; type=INTEGER,access=rw------,values=1,min=0,max=2,step=0
  : values=1
[root@5b83bae544df /]# aplay /usr/share/sounds/alsa/Front_Center.wav
Playing WAVE '/usr/share/sounds/alsa/Front_Center.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Mono
```

https://hub.docker.com/r/ailispaw/alsa-utils/

### dnsdock

The ARM version of https://github.com/aacebedo/dnsdock

```
[bargee@barge-rpi ~]$ docker build -t ailispaw/dnsdock:arm64v8 .
```

Or just run the image from Docker Hub,

```
[bargee@barge-rpi ~]$ docker run -d --restart=always -v /var/run/docker.sock:/var/run/docker.sock -p 0.0.0.0:53:53/udp --name dnsdock ailispaw/dnsdock:arm64v8
```

https://hub.docker.com/r/ailispaw/dnsdock/

### lchika

An example of the Active LED Blinking on Raspberry Pi

```
[bargee@barge-rpi ~]$ docker build -t lchika:arm64v8 .
[bargee@barge-rpi ~]$ docker run --rm -v /sys:/sys lchika:arm64v8
```

### MJPG-streamer

Stream a Video from Raspberry Pi with a Linux-UVC Compatible Webcam

```
[bargee@barge-rpi ~]$ docker build -t ailispaw/mjpg-streamer:arm64v8 .
```

Or just run the image from Docker Hub,

```
[bargee@barge-rpi ~]$ docker run -d --device=/dev/video0 -p 8080:8080 ailispaw/mjpg-streamer:arm64v8
```

https://hub.docker.com/r/ailispaw/mjpg-streamer/
