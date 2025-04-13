#!/usr/bin/env bash

# Скрипт который построчно читает из /etc/os-release и показывает его содержимое на экране строка за строкой

while read line; do ((++i)); echo "line$i,$line,"; done < /etc/os-release