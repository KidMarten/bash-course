#!/usr/bin/env bash

# Скрипт, который выводит таблицу умножения для заданного числа

return_table () {
    input=$1
    for i in {1..9}; do
      echo $(( input * i ))
    done
}

read -p "Введите число: " user_input

if [ -z $user_input ]; then
  echo "Введите число."
  exit 1
elif ! [[ $user_input =~ ^-?[0-9]+$ ]]; then
  echo "Допустимы целые числа"
  exit 1
else
  return_table $user_input
fi
