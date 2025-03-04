#!/bin/dash

for file in *.c
do
    echo $file
    grep -E '^#include' $file |
    cut -d' ' -f2 |
    tr -d '<>"'
done