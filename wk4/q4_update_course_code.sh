#!/bin/dash

# Grab all the cmd args and separate them
for file in "$@"; do
    echo $file
    #  If not a file skip this iteration
    if [ ! -f "$file" ]; then
    continue
    fi

    temporary_file="$(mktemp)"

    # get the subsitution from our original file and send the output to our temp file
    # Move the temp file contents replacing the file contents
    # Remove our temp file
    sed -E 's/COMP2041/COMP2042/g; s/COMP9044/COMP9042/g' "$file" > "$temporary_file" &&
    mv "$temporary_file" "$file"

    rm -f "$temporary_file"

done