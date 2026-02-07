#!/usr/bin/env bash

command="$1"
color="$2"

resistor_colors=(
    "black" "brown" "red" "orange" "yellow"
    "green" "blue" "violet" "grey" "white"
)

case "$command" in
    code)
        for i in "${!resistor_colors[@]}"; do
            if [[ ${resistor_colors[i]} == "$color" ]]; then
                echo "$i"; break
            fi
        done ;;
    colors) printf "%s\n" "${resistor_colors[@]}" ;;
esac
