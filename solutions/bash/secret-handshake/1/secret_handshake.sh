#!/usr/bin/env bash

code=$1
handshakes=("wink" "double blink" "close your eyes" "jump")

for (( i = 0; i < ${#handshakes[@]}; i++ )); do
    if (( (code >> i) & 1 )); then
        actions+=("${handshakes[i]}")
    fi
done

if (( (code >> ${#handshakes[@]}) & 1 )); then
    for (( i = ${#actions[@]}-1; i >= 0; i-- )); do
        reversed+=("${actions[i]}")
    done
    actions=("${reversed[@]}")
fi

(IFS=,; echo "${actions[*]}")
