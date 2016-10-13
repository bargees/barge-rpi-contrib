#!/bin/sh

NAME=bluetoothd
DAEMON=/usr/libexec/bluetooth/$NAME

test -x $DAEMON || exit 0

case "$1" in
  start)
    echo "Starting hciattach..."
    # The first initialization may fail right after stop, then just try again.
    /usr/bin/hciattach -t 10 /dev/ttyAMA0 bcm43xx 921600 noflow - || \
    /usr/bin/hciattach -t 30 /dev/ttyAMA0 bcm43xx 921600 noflow - || exit 1
    /usr/bin/hciconfig hci0 up
    echo -n "Starting $NAME: "
    start-stop-daemon -S -q -b -x $DAEMON -- -C
    [ $? = 0 ] && echo "OK" || echo "FAIL"
    ;;
  stop)
    echo -n "Stopping $NAME: "
    start-stop-daemon -K -q -n $NAME
    [ $? = 0 ] && echo "OK" || echo "FAIL"
    echo "Stopping hciattach"
    /usr/bin/hciconfig hci0 down
    pkill hciattach
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}" >&2
    exit 1
    ;;
esac

exit 0
