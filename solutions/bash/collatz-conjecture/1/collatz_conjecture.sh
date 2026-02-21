#!/usr/bin/env bash

number=$1

(( number <= 0 )) && { echo "Error: Only positive numbers are allowed"; exit 1; }

for (( i = 0; number != 1; i++ )); do
    if (( number % 2 == 0 )); then
        (( number /= 2 ))
    else
        (( number = number * 3 + 1 ))
    fi
done

echo "$i"
