#!/usr/bin/env bash

input=$1
span=$2

if (( span > ${#input} )); then
    echo "span must not exceed string length" >&2;
    exit 1
fi

if (( span < 0 )); then
    echo "span must not be negative" >&2;
    exit 1
fi

number_pat='^[0-9]+$'
if ! [[ $input =~ $number_pat ]]; then
    echo "input must only contain digits" >&2;
    exit 1
fi

(( n_series=${#input} - span + 1 ))

max_product=0

for (( i = 0; i < n_series; i++ )); do
    product=1
    for (( j = i; j < i + span; j++ )); do
        digit=${input:j:1}
        (( product *= digit ))
    done

    if (( product > max_product )); then
        (( max_product = product ))
    fi
done

echo "$max_product"
