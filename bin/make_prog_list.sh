#!/bin/bash -xv

# Put Comments here or on many lines
# To describe the code bellow

outfile="$HOME/Desktop/zshell_scripts/proglist.txt"
echo "$outfile"
for dir in `echo "$PATH" | tr ':' ' '`
do
    cd "$dir"

    for file in *
    do
        if [ -x "$file" -a ! -d "$file" ]
        then
            echo "$file"
        fi
    done
done > "$outfile"


