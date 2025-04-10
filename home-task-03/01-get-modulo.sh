#!/bin/bash

# Скрипт оболочки, который запрашивает два целых числа и выводит частное и остаток от их деления.

# Большее число становится делимым, а меньшее знаменателем 

if [[ -z $1 || -z $2 ]]; then
  echo "Enter 2 values"
  exit
fi

if [ $2 -gt $1 ]; then
  dividend=$2
  denominator=$1
else
  dividend=$1
  denominator=$2
fi

if [ $denominator -eq 0 ]; then
  echo "Enter non zero values"
  exit
fi

quotient=$((dividend / denominator))
modulo=$(($dividend % $denominator))

echo "Частное: $quotient"
echo "Остаток: $modulo"