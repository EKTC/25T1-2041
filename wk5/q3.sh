#!/bin/dash

top_and_bottom() {

    # We use return as if we used exit it would completely stop the program running itself
    if ! [ -f "$1" ]
    then
        echo "================="
        echo "$0: error: $1 is not a valid file" >&2
        echo "================="
        return
    fi

    # sed cmd that allows us to print the first line and last line
    # Semicolon to chain the commands
    echo "================="
    echo "File: $1"
    echo "-----------------"
    sed -n '1p;$p' "$1"
    echo "================="
}

for file in "$@"
do
    top_and_bottom "$file"
done