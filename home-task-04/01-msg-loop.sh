#!/bin/bash

# Скрипт с циклом for для отображения сообщения пользователя 10 раз

read -p "Enter your message: " msg

if [ -n msg ]; then
  echo "Input is empty. Try again."
  exit 1
fi

for count in {1..10}; do
  echo $msg
done