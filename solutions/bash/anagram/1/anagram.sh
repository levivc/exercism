#!/usr/bin/env bash

target=$1
candidates=$2

get_letters() {
    local target=$1
    local -n letters=$2

    for (( i = 0; i < ${#target}; i++ )); do
        letter=${target:i:1};
        lc=${letter,}
        (( letters["$lc"]++ ))
    done
}

declare -A target_letters
get_letters "$target" target_letters

for candidate in $candidates; do
    if [[ ${target,,} == "${candidate,,}" ]]; then continue; fi

    unset candidate_letters; declare -A candidate_letters
    get_letters "$candidate" candidate_letters

    if (( ${#target_letters[@]} != ${#candidate_letters[@]} )); then continue; fi

    is_match=1
    for letter in "${!target_letters[@]}"; do
        if [[ ${target_letters["$letter"]} != "${candidate_letters["$letter"]}" ]]; then
            is_match=0; break
        fi
    done

    if (( is_match )); then matches+=("$candidate"); fi
done

(( ${#matches[@]} )) && echo "${matches[*]}" || exit 0
