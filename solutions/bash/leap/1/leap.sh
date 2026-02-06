#!/usr/bin/env bash

year=$1

if [[ $# -ne 1 || ! $year =~ ^[0-9]+$ ]]; then
    echo "Usage: leap.sh <year>" >&2; exit 1
fi

if (( year % 400 == 0 )); then echo true; exit; fi
if (( year % 100 == 0 )); then echo false; exit; fi
if (( year % 4 == 0 )); then echo true; exit; fi

echo false
