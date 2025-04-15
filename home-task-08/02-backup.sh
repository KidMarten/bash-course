#!/usr/bin/env bash

# Скрипт для создания резервных копий на другой машине

backup_dirs=($@)

if [ ${#backup_dirs} -eq 0 ]; then
  echo List of dirs is empty
  exit 1
fi

dest_dir="/mnt/backup/"
dest_server="192.168.0.55"
backup_time=$(date "+%Y-%m-%d")

for dir in ${backup_dirs[@]}; do
  arc_name=$(echo ${dir}.${backup_time}.tar.gz)
  tar -czvf /tmp/$arc_name $dir
  scp /tmp/$arc_name $dest_server:$dest_dir
  rm /tmp/$arc_name
done