#!/usr/bin/env bash

color1="$1" color2="$2"

resistor_colors=(
    "black" "brown" "red" "orange" "yellow"
    "green" "blue" "violet" "grey" "white"
)

get_code() {
    for i in "${!resistor_colors[@]}"; do
        if [[ ${resistor_colors[i]} == "$1" ]]; then
            echo "$i"; return 0
        fi
    done
    return 1
}

if code1="$(get_code "$color1")" && code2="$(get_code "$color2")"; then
    echo "$(( code1*10 + code2 ))"
else
    echo "invalid color" >&2; exit 1
fi
