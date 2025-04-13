#!/usr/bin/env bash

# Код для получения дня недели по его номеру

weekDays=(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

read -p "Enter day number: " number

if [[ -z $number || $number -le 0 || $number -gt 7 ]]; then
  echo "Number must be between 1 and 7"
  exit 1
fi

echo Week day: ${weekDays[$number - 1]}