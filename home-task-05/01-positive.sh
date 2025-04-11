#!/usr/bin/env bash

# Скрипт, который проверяет является ли число положительным

is_positive () {
  if [ -z $1 ]; then
    echo "Ввод пустой. Введите число."
    exit 1
  fi

  if ! [[ $1 =~ ^-?[0-9]+$ ]]; then
    echo "Ввод должен быть целочисленным"
    exit 1
  fi
  
  if [ $1 -gt 0 ]; then
    echo "$1 is positive"
  elif [ $1 = 0 ]; then
    echo "Ноль является неотрицателньым числом"
  else
    echo "$1 is negative"
  fi

}

read -p "Введите число: " user_input
is_positive $user_input