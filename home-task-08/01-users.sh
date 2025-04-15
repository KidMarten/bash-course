#!/usr/bin/env bash

# Скрипт для добавления пользователя на различные машины

add_user () {
  local username=$1
  local uid=$2
  local hostname=$3
  local pass=$4
  ssh $hostname "echo $pass | sudo -S useradd -m -s /bin/bash -u $uid $username"
}

read -p "Enter user name: " username
read -p "Enter user ID: " uid
read -p "Enter password: " pass

if [[ -z $username || -z $uid || -z $uid ]]; then
  echo "Input is empty. Enter Username, UID and password"
  exit 1
fi

while IFS= read -r host; do
    add_user $username $uid $host $pass
done < home-task-08/hosts.txt
