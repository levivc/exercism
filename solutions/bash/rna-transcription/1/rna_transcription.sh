#!/usr/bin/env bash

dna_sequence="$1"

for (( i = 0; i < ${#dna_sequence}; i++ )); do
    nucleotide=${dna_sequence: i:1}
    case $nucleotide in
        "G") rna_sequence+="C" ;;
        "C") rna_sequence+="G" ;;
        "T") rna_sequence+="A" ;;
        "A") rna_sequence+="U" ;;
        *) echo "Invalid nucleotide detected." >&2; exit 1 # need validation so no 'tr'
    esac
done

echo "$rna_sequence"
