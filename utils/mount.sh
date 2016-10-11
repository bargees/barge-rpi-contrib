#!/bin/sh

if [ "$(id -u)" != "0" ]; then
  echo "$(basename $0): Operation not permitted, must be root." >&2
  exit 1
fi

SERVER_ADDR=$1
MOUNT_POINT=$2

if [ -z "${SERVER_ADDR}" -o -z "${MOUNT_POINT}" ]; then
  echo "Usage: $(basename $0) <server-ip>:<exported-dir> <local-mount-point>" >&2
  exit 1
fi

mkdir -p "${MOUNT_POINT}"

mount -t nfs "${SERVER_ADDR}" "${MOUNT_POINT}" \
  -o rw,async,noatime,rsize=32768,wsize=32768,nolock,vers=3,actimeo=1
