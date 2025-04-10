#!/bin/bash

# Скрипт для вывода всех папок и файлов в каталоге /var

for element in /var/*; do
  echo $element
done