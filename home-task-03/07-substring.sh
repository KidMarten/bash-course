#!/bin/bash

# Скрипт оболочки, который проверяет наличие подстроки в строке
read -p "Enter string: " str
read -p "Enter substring: " substr

if [[ $str = *"$substr"* ]]; then
  echo "Substring is present"
else
  echo "Substring is absent"
fi
