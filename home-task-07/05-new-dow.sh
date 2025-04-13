#!/usr/bin/env bash

# Скрипт, который добавляет еще один день в неделю

weekDays=(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
weekDays+=(Earthsday)
echo ${weekDays[@]}