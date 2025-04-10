#!/bin/bash

# Скрипт оболочки, который проверяет положительное число или отрицательное
read -p "Enter string: " str
read -p "Enter substring: " substr

if [[ $str = *"$substr"* ]]; then
  echo "Substring is present"
else
  echo "Substring is absent"
fi
