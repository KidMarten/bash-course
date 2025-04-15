#!/usr/bin/env bash

# Скрипт для отслеживания места на диске

filesystems=("/dev/nvme0n1p2" "/dev/nvme0n1p1" "/dev/loop27")

for fs in ${filesystems[@]}; do
  util=$(df -h | grep "${fs}" | awk '{ print $5 }')
  util="${util/"%"/""}"
  if [ $util -gt 90 ]; then
    echo "$fs is almost out of memory" > ./alert.txt
  fi
done