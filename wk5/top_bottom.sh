#!/bin/dash

top_and_bottom() {
    echo "============="
    echo "File: $1"
    echo "-------------"
    head -1 $1
    tail -1 $1
    echo "============="
}

if ! [ "$#" -eq 1 ]
then
    echo "One argument needed only"
    exit 1
fi

if ! [ -f "$1" ]
then
    echo "Not a file"
    exit 1
fi

top_and_bottom "$1"