#!/bin/bash

# Скрипт, который запрашивает сегодняшний день недели и выводит его
read -p "Enter today's day of week: " dow

if [ -n "$dow" ]; then
    echo $dow
else
    echo "Input is empty"
fi