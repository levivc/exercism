#!/usr/bin/env bash

pangram=$1
alphabet="abcdefghijklmnopqrstuvwxyz"
declare -A letters

for (( i = 0; i < ${#pangram}; i++ )); do
    letter=${pangram:i:1}
    lc=${letter,}
    [[ $lc == [$alphabet] ]] && letters[$lc]=1

    if (( ${#letters[@]} == 26 )); then
        echo "true"; exit
    fi
done

echo "false"
