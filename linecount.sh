#!/bin/bash

# count the total line of non-blank lines in a given directory
# with a give file type (c by default)
# author Xi Wang in Nanjing University

# usage: ./linecount.sh path [filetype]

lines=0
filetype='c'
if [ $# -le 2 ];then
    filetype=$2
fi

countlines()
{
    dir=$1 
    cd $dir
    linesinthisdir=`grep -s '^.' *.$filetype | wc -l`
    # count line of non-blank lines in $dir

    lines=`expr $lines + $linesinthisdir`
    for file in `ls`
    # count sub-dirs recursively
    do
        if [ -d $file ]; then
            countlines $file
        fi
    done
    if [ $dir != "." ]; then
        cd ..
    fi
    return $lines
}

countlines "$1"

echo "$lines"
