#/usr/bin/env bash

# Скрипт для расчета чисел Фибоначчи

calc_fibonacci() {
  first_num=0
  second_num=1

  steps=$1
  leaps=$(( steps - 3 ))

  echo $first_num
  echo $second_num

  for i in $(seq 0 $leaps); do
    value=$(( first_num + second_num))
    echo $value
    first_num=$second_num
    second_num=$value
  done
}

read -p "Введите число: " user_input

if [ -z $user_input ]; then
  echo "Введите число."
  exit 1
elif ! [[ $user_input =~ ^-?[0-9]+$ ]]; then
  echo "Допустимы только числа"
  exit 1
elif [ $user_input -lt 3 ]; then
  echo "Число жолжно быть больше 3"
  exit 1
else
  calc_fibonacci $user_input
fi
