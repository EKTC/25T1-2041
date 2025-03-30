#!/bin/dash

if [ "$#" -lt 1 ]
then
    echo "Incorrect Number of args"
    exit 1
fi

status=0
for archive in "$@"
do
    if ! [ -f archive ]
    do
        echo "$0: error: $archive is not a file" 
        status=1
        continue
    done

    case "$#" in
        0)
        
        ;;
    esac
done

