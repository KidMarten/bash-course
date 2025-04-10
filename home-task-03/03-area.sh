#!/bin/bash

read -p "Введите длину: " length
read -p "Введите ширину: " width

area=$((length*width))
per=$((2*(length+width)))

echo "Площадь $area"
echo "Периметр $per"