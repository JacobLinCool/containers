#!/bin/bash
set -e

if [ "${1#*.}" = "c" ]; then
    gcc -o /tmp/a.out "$@" -lm
    set -- valgrind --leak-check=full -s /tmp/a.out
elif [ $1 = "make" ]; then
    old=$(find .)
    make
    new=$(find .)
    for file in $(comm -13 <(echo "$old") <(echo "$new")); do
        if [ -x "$file" ]; then
            set -- bash -c "valgrind --leak-check=full -s '$file' && rm '$file'"
            break
        fi
    done
fi

exec "$@"
