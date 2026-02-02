#!/usr/bin/env bash

allergies=('eggs' 'peanuts' 'shellfish' 'strawberries' 'tomatoes' 'chocolate' 'pollen' 'cats')

get_index() {
    local i
    for (( i=0; i < ${#allergies[@]}; i++ )); do
        if [[ "${allergies[i]}" == "$1" ]]; then
            echo "$i"; return 0
        fi
    done

    return 1
}

allergic_to() {
    local i
    if ! i=$(get_index "$2"); then
        printf "Unknown allergy: '%s'\n" "$2" >&2; exit 1
    fi

    if (( ("$1" >> i) & 1 )); then
        echo "true"
    else
        echo "false"
    fi
}

get_allergies() {
    local i
    local result=()

    for (( i=0; i < ${#allergies[@]}; i++ )); do
        if (( ("$1" >> i) & 1)); then
            result+=("${allergies[i]}")
        fi
    done

    echo "${result[@]}"
}

case "$2" in
    "list") get_allergies "$1" ;;
    "allergic_to") allergic_to "$1" "$3" ;;
    *) exit 1
esac
