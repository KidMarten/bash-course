#!/bin/bash

# Скрипт оболочки, который запрашивает два целых числа и выводит частное и остаток от их деления.

# Большее число становится делимым, а меньшее знаменателем 
if [ $2 -gt $1 ]; then
  dividend=$2
  denominator=$1
else
  dividend=$1
  denominator=$2
fi

quotient=$(expr $dividend / $denominator)
modulo=$(($dividend % $denominator))

echo "Частное: $quotient"
echo "Остаток: $modulo"