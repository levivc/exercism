#!/usr/bin/env bash

if (( $# != 2 )); then echo "2 arguments expected"; exit 1; fi

start_verse=$1
verse_count=$2

if (( start_verse - verse_count < 0 )); then
    echo "cannot generate more verses than bottles"; exit 1;
fi

count_str=(
    "no" "one" "two" "three" "four" "five"
    "six" "seven" "eight" "nine" "ten"
)

for (( i = 0; i < verse_count; i++ )); do
    (( count = start_verse - i ))
    (( count != 1 )) && plural_suffix="s" || plural_suffix=

    cur_count=${count_str[count]}
    for (( j = 0; j < 2; j++ )); do
        printf "%s green bottle%s hanging on the wall,\n" \
            "${cur_count^}" "$plural_suffix"
    done

    printf "And if one green bottle should accidentally fall,\n"

    (( --count != 1 )) && plural_suffix="s" || plural_suffix=
    printf "There'll be %s green bottle%s hanging on the wall.\n" \
        "${count_str[count]}" "$plural_suffix"

    if (( i < verse_count-1 )); then echo; fi
done

