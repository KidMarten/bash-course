#!/bin/bash

# Скрипт оболочки, который принимает целое число в виде аргумента и выводит его таблицу умножения
if [ -z $1 ]; then
  echo "Enter a value"
  exit
fi


echo "Таблица умножения для числа $1"
expr $1 \* 1
expr $1 \* 2
expr $1 \* 3
expr $1 \* 4
expr $1 \* 5
expr $1 \* 6
expr $1 \* 7
expr $1 \* 8
expr $1 \* 9
