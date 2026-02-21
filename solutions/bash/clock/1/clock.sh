#!/usr/bin/env bash

hours=$1 min=$2

digit_pat='^[+-]?[[:digit:]]+$'
if [[ ! ($hours =~ $digit_pat) || ! ($min =~ $digit_pat) ]];
    then echo "invalid arguments"; exit 1;
fi

if (( $# > 2 )); then
    op=$3 offset=$4 offset_pat='^[[:digit:]]+$'

    [[ ! ($offset =~ $offset_pat) ]] && { echo "invalid arguments"; exit 1; }
    case $op in
        +) ;;
        -) (( offset = -offset )) ;;
        *) echo "invalid arguments"; exit 1 ;;
    esac
fi


(( total_min = (hours * 60 + min + offset) % 1440 ))
(( total_min < 0 )) && (( total_min += 1440 ))

printf "%02d:%02d\n" "$(( total_min / 60 ))" "$(( total_min % 60 ))"

