#!/bin/sh

if [ "$(id -u)" != "0" ]; then
  echo "$(basename $0): Operation not permitted, must be root." >&2
  exit 1
fi

DEVICE=/dev/mmcblk0

read -p "Are you sure to partition the SD card (y/n)? " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  (echo n; echo p; echo 3; echo ; echo 5655 ; echo w;) | fdisk ${DEVICE}
  (echo t; echo 3; echo 82; echo w;) | fdisk ${DEVICE}
  mkswap -L BARGE-SWAP ${DEVICE}p3

  (echo n; echo p; echo 2; echo ; echo ; echo w;) | fdisk ${DEVICE}
fi
