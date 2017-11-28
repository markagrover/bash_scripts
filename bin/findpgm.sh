#!/bin/sh

filename="$1"
findpgm()
{
    #echo "$filename"

    grep "$filename" ~/Desktop/zshell_scripts/proglist.txt | column

}
findpgm


