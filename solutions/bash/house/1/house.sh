#!/usr/bin/env bash

if (( $# != 2 )); then
    echo "invalid amount of arguments: need 2"  >&2;
    exit 1;
fi

number_pat='^[0-9]+$'
if ! [[ $1 =~ $number_pat && $2 =~ $number_pat ]]; then
    echo "invalid argument types: need integers" >&2;
    exit 1
fi

if ! (( $1 >= 1 && $1 <= 12 && $2 >= 1 && $2 <= 12)); then
    echo "invalid argument range: must be between 1 and 12 inclusive" >&2;
    exit 1
fi

if (( $2 < $1 )); then
    echo "first argument must be <= than second argument" >&2;
    exit 1
fi

subjects=(
    "the house that Jack built." "the malt" "the rat" "the cat" "the dog"
    "the cow with the crumpled horn" "the maiden all forlorn"
    "the man all tattered and torn" "the priest all shaven and shorn"
    "the rooster that crowed in the morn" "the farmer sowing his corn"
    "the horse and the hound and the horn"
)

sentences=("that lay in" "that ate" "that killed" "that worried"
    "that tossed" "that milked" "that kissed" "that married"
    "that woke" "that kept" "that belonged to"
)

for (( i=$1-1; i<$2; i++ )); do
    echo "This is ${subjects[i]}"

    for (( j=i-1; j >= 0; j-- )); do
        echo "${sentences[j]} ${subjects[j]}"
    done

    if (( i < $2-1 )); then echo; fi
done
