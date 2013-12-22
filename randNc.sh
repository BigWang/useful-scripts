#!/bin/bash
# generate a random n bit number (dec or hex)
# n must <= 16 if dec
#        <= 32 if hex
# usage ./randNc N(an integer) [-d]

N=$1
limit=32
if [ $# -ge 2 ] && [ $2 == "-d" ]; then
# if we need decimal output, limit N to be 16
    limit=16
fi

if [ $N -gt $limit ]; then
    echo "param1 must be less than $limit, use $limit instead!"
    N=$limit
fi    

randCs=$(cat /dev/urandom | head -1 | md5sum | head -c "$N")
if [ $# -ge 2 ] && [ $2 == "-d" ]; then
    printf "%d\n" "0x$randCs"
else
    echo $randCs
fi
