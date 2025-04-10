#!/bin/bash

# Скрипт для вывода первых 10 чисел кратных трем, с использованием цикла until

counter=1

until [ $counter -gt 10 ]; do
  echo $((counter * 3))
  counter=$(( $counter + 1 ))
done