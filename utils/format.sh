#!/bin/sh

if [ "$(id -u)" != "0" ]; then
  echo "$(basename $0): Operation not permitted, must be root." >&2
  exit 1
fi

DEVICE=/dev/mmcblk0

read -p "Are you sure to format the SD card (y/n)? " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  mkfs.ext4 -b 4096 -i 4096 -F -L BARGE-DATA ${DEVICE}p2
fi
