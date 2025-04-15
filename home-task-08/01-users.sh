#!/usr/bin/env bash

# Скрипт для добавления пользователя на различные машины

add_user () {
  local username=$1
  local uid=$2
  local hostname=$3
  ssh $hostname "echo $PASSWORD | sudo -S useradd -m -s /bin/bash -u $uid $username"
}

read -p "Enter user name: " username
read -p "Enter user ID: " uid

if [[ -z $username || -z $uid ]]; then
  echo "Input is empty. Enter Username and UID"
  exit 1
fi

while IFS= read -r $host; do
    add_user $username $uid $host
done < home-task-08/hosts.txt
