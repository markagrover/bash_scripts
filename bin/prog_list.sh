#!/bin/zsh
set -xv
# Bash Script to search through PATH for programs located in the bin Dirs.
# We used 'tr' which stands for Translate.
# simple use case here is just to replace characters.
outfile="$HOME/bin/ect/proglist.txt"
for dir in `echo "$PATH" | tr ':' ' '`
do
  cd $dir
# Sort our our data before piping it to our txt file.
  for filename in *
  do
# test each file in this dir and output its name if a program
    if [ -x $filename -a ! -d $filename ]
    then
      echo "$filename"
    fi
  done
done | sort > $outfile
set +xv
