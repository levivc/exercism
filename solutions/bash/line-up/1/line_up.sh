#!/usr/bin/env bash

name=$1
position=$2

if (( $# != 2 )); then echo "usage: ${0%%.*} <name> <position>" >&2; exit 1; fi
if ! [[ $position =~ ^[0-9]+$ && $position -ge 1 ]]; then
    echo "position must be a positive integer" >&2; exit 1;
fi

last_digit=${position: -1}
(( position >= 10 )) && second_last=${position: -2: 1} || second_last=0
ordinal_suffix=th

if (( second_last != 1 )); then
    if   (( last_digit == 1 )); then ordinal_suffix=st;
    elif (( last_digit == 2 )); then ordinal_suffix=nd;
    elif (( last_digit == 3 )); then ordinal_suffix=rd; fi
fi

echo "$name, you are the $position$ordinal_suffix customer we serve today. Thank you!"
