#!/bin/bash

# Скрипт для вывода всех папок и файлов в каталоге /var

for element in $(ls /var/*); do
  echo $element
done