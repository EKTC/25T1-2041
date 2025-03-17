#!/bin/dash

if [ "$#" -ne 1 ] || ! [ "$1" -eq "$1" ] || [ "$1" -lt 0 ]
then
    echo "Incorrect Args"
    exit 1
fi

if [ "$1" -eq 1 ]
then
    echo "$1 is not prime"
    exit 1
fi

i=2

while [ "$i" -lt "$1" ]
do
    if [ $(($1 % $i)) -eq 0 ]
    then
        echo "$1 is not prime"
        exit 1
    fi
done

echo "$1 is prime"
exit 0