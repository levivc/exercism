#!/usr/bin/env bash

string=$1
n=$2

[[ -z $string ]] && { echo "series cannot be empty" >&2; exit 1; }
(( n > ${#string} )) && { echo "slice length cannot be greater than series length" >&2; exit 1; }
(( n == 0 )) && { echo "slice length cannot be zero" >&2; exit 1; }
(( n < 0 )) && { echo "slice length cannot be negative" >&2; exit 1; }

for (( i = 0; i <= ${#string}-n; i++ )); do
    substrings+=("${string: i:n}");
done

echo "${substrings[*]}"
