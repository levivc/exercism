#!/usr/bin/env bash

ndigits=${#1}
result=0

for (( i=0; i<ndigits; i++ )); do
    digit=${1:i:1}
    if ! [[ $digit == [0-9] ]]; then
        printf "Invalid digit: \'%s\'\n" "$digit" >&2
        exit 1
    fi
    (( result+=digit ** ndigits ))
done

if (( result == $1 )); then
    echo "true"
else
    echo "false"
fi

