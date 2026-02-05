#!/usr/bin/env bash

shopt -s extglob

if [[ $# == 1 ]]; then
   case $1 in
        total) bc <<< "2^64 - 1"; exit 0 ;;

        +([0-9]))
            if (( $1 >= 1 && $1 <= 64 )); then
                bc <<< "2^($1 - 1)"; exit 0
            fi ;;
    esac
fi

echo "Error: invalid input" >&2; exit 1
