#!/bin/dash

if [ "$#" -eq 1 ]
then
    first=1
    last=$1
    inc=1
elif [ "$#" -eq 2 ]
then
    first=$1
    last=$2
    inc=1
elif [ "$#" -eq 3 ]
then
    first=$1
    last=$3
    inc=$2
else
    echo "Neither option"
fi

curr=$first

while [ $curr -le $last ]
do
    echo "$curr"
    curr=$((curr + inc))
done
