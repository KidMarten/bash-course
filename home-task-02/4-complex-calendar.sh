#!/bin/bash
# Скрипт, который спрашивает день недели, уточняет число и выводит все на одной строке

read -p "Enter today's day of week: " dow
read -p "Enter today's date: " date

if [[ -n "$dow" && -n "$date" ]]; then
    echo $dow $date
else
    echo "Input is empty. Enter today's day of week and date"
    exit 1
fi