#!/bin/bash

# Скрипт оболочки, который проверяет положительное число или отрицательное
read -p "Enter number: " number

if ! [[ $number =~ ^[+-]?[0-9]+$ ]]; then
  echo "Integer value expected"
  exit
fi

if [ $number -gt 0 ]; then
  echo "Number is positive"
else
  echo "Number is negative"
fi
