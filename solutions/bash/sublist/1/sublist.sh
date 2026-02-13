#!/usr/bin/env bash

list_a=$1 list_b=$2
IFS=", " read -ra arr_a <<< "${list_a: 1:${#list_a}-2}"
IFS=", " read -ra arr_b <<< "${list_b: 1:${#list_b}-2}"

is_sublist() {
    local -n a=$1 b=$2
    local a_len=${#a[@]} b_len=${#b[@]}
    for (( i = 0; i <= b_len - a_len; i++ )); do
        local j=0
        while (( j < a_len )) && [[ ${a[j]} == "${b[i+j]}" ]]; do (( j++ )); done
        if (( j == a_len )); then return 0; fi
    done
    return 1
}

if (( ${#arr_a[@]} == ${#arr_b[@]} )); then
    for (( i = 0; i < ${#arr_a[@]}; i++ )); do
        if [[ ${arr_a[i]} != "${arr_b[i]}" ]]; then
            echo "unequal"; exit
        fi
    done
    echo "equal"
elif (( ${#arr_a[@]} < ${#arr_b[@]} )); then
    if is_sublist arr_a arr_b; then echo "sublist"; else echo "unequal"; fi
else
    if is_sublist arr_b arr_a; then echo "superlist"; else echo "unequal"; fi
fi
