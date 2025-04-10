#!/bin/bash

# Скрипт, который выводит три аргумента в обратном порядке
if [ $# != 3 ]; then
    echo "Enter three arguments"
    exit 1
fi
echo $3 $2 $1