#!/bin/bash

# Функция для вычисления n-го числа Фибоначчи
fibonacci() {
    local n=$1
    if (( n <= 0 )); then
        return 0
    elif (( n == 1 )); then
        echo 0
        return 0
    elif (( n == 2 )); then
        echo 1
        return 0
    else
        # Рекурсивный вызов для n-1 и n-2
        local prev1=$(fibonacci $((n - 1)))
        local prev2=$(fibonacci $((n - 2)))
        echo $((prev1 + prev2))
    fi
}

# Запрос количества чисел Фибоначчи у пользователя
read -p "Введите количество чисел Фибоначчи: " count

# Проверка на положительное число
if ! [[ "$count" =~ ^[0-9]+$ ]] || [ "$count" -le 0 ]; then
    echo "Пожалуйста, введите положительное целое число."
    exit 1
fi

# Вывод чисел Фибоначчи до указанного количества
echo "Числа Фибоначчи до $count:"
for (( i=1; i<=count; i++ )); do
    fibonacci $i
done