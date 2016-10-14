## Dockerfiles for Barge RPi (armhf)

### dnsdock

The ARM version of https://github.com/aacebedo/dnsdock

```
[bargee@barge-rpi ~]$ docker build -t ailispaw/dnsdock:armhf .
[bargee@barge-rpi ~]$ docker run -d --restart=always -v /var/run/docker.sock:/var/run/docker.sock -p 0.0.0.0:53:53/udp --name dnsdock ailispaw/dnsdock:armhf
```

https://hub.docker.com/r/ailispaw/dnsdock/

### lchika

An example of the Active LED Blinking on Raspberry Pi

```
[bargee@barge-rpi ~]$ docker build -t lchika .
[bargee@barge-rpi ~]$ docker run --rm -v /sys:/sys lchika
```

### MJPG-streamer

Stream a Video from Raspberry Pi with a Linux-UVC Compatible Webcam

```
[bargee@barge-rpi ~]$ docker build -t ailispaw/mjpg-streamer .
[bargee@barge-rpi ~]$ docker run -d --device=/dev/video0 -p 8080:8080 ailispaw/mjpg-streamer
```

https://hub.docker.com/r/ailispaw/mjpg-streamer/
