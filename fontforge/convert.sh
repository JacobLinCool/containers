#!/bin/sh
set -e

export FONTFORGE_LANGUAGE=ff

# There are no arguments, throw an error
if [ $# -eq 0 ]; then
    echo "You should pass filenames as arguments"
    exit 1
fi

t0="otf"
t1="ttf"
t2="woff"
t3="woff2"
t4="svg"

# loop through all arguments
for filename in "$@"; do
    # check if the file exists
    if [ ! -f "$filename" ]; then
        echo "File $filename does not exist"
        exit 1
    fi
    
    extension=${filename##*.}

    # loop through all types
    for idx in 0 1 2 3 4; do
        eval type=\$t$idx
        if [ "$extension" != "$type" ]; then
            echo "Converting $filename to $type"
            fontforge -c 'Open($1); Generate($1:r + ".'$type'");' "$filename" &
        fi
    done

    # wait for all processes to finish
    wait
done
