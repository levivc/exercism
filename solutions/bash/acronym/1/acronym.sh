#!/usr/bin/env bash

long_name=$1
long_name="${long_name//-/ }"
long_name="${long_name//[[:punct:]]/}"

for word in $long_name; do
    printf "%c" "${word^}"
done
printf "\n"
