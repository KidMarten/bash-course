#!/bin/bash

# Скрипт для вывода первых 10 чисел кратных трем

counter=1

while [ $counter -le 10 ]; do
  echo $((counter * 3))
  counter=$(( $counter + 1 ))
done