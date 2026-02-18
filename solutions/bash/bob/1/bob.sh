#!/usr/bin/env bash

message=$1
if [[ $message =~ ^[[:space:]]*$ ]]; then echo "Fine. Be that way!"; exit 0; fi

response=0
if [[ $message =~ [[:alpha:]] && $message == "${message^^}" ]]; then (( response |= 0x1 )); fi
if [[ $message =~ "?"[[:space:]]*$ ]]; then (( response |= 0x2 )); fi

case $response in
    0) echo "Whatever." ;;
    1) echo "Whoa, chill out!" ;;
    2) echo "Sure." ;;
    3) echo "Calm down, I know what I'm doing!" ;;
esac
