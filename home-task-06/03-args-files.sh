#!/usr/bin/env bash


# Скрипт, который создает файлы с содержимым строк из /etc/os-release

while read line; do ((++i)); echo "line$i,$line,"; done < /etc/os-release | xargs -n 2 -d ',' sh -c 'name=$(echo $0 | tr -cd "[:print:]\n"); content=$1; echo $content > $name'