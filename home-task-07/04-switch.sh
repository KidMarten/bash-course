#!/usr/bin/env bash

# Скрипт оболочки, чтобы поменять среду и пятницу местами относительно первоначального порядка

weekDays=(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

wed=${weekDays[2]}
fr=${weekDays[4]}

weekDays=(${weekDays[@]:0:2} $fr ${weekDays[3]} $wed ${weekDays[@]:4:6})

echo ${weekDays[@]}