#!/bin/bash
cd "$(dirname "$0")"

make -s

tests=$(ls tests/*.S 2>/dev/null | xargs -n1 basename | sed 's/\.S$//')

declare -a names times_qemu times_vadl

for t in $tests; do
    echo "Running test: $t"
    names+=("$t")

    tq=$( { time -p make run-qemu-$t 2>/dev/null; } 2>&1 | awk '/^real/{print $2}' )
    times_qemu+=("$tq")

    tv=$( { time -p make run-vadl-$t 2>/dev/null; } 2>&1 | awk '/^real/{print $2}' )
    times_vadl+=("$tv")
done

printf "%-12s %12s %12s %12s\n" "NAME" "TIME QEMU" "TIME VADL" "RELATIVE"

for i in "${!names[@]}"; do
    rel=$(awk "BEGIN {printf \"%.2f\", ${times_vadl[$i]}/${times_qemu[$i]}}")
    printf "%-15s %12s %12s %10s\n" "${names[$i]}" "${times_qemu[$i]}s" "${times_vadl[$i]}s" "$rel"
done