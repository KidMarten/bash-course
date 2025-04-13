#!/usr/bin/env bash

# Скрипт который построчно читает из /etc/os-release, показывает его содержимое на экране строка за строкой с разделением по запятой

while read line; do ((++i)); echo "line$i,$line,"; done < /etc/os-release | xargs -n 2 -d ','