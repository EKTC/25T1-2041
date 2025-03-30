#!/bin/dash

print_message() {
    if [ "$#" -eq 2 ]
    then
        echo "$0: Error $2"
        exit "$1"
    else 
        echo "$0: Warning $1"
    fi

}

# if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]
# then
#     echo "Invalid Arguments"
#     exit 1
# fi

print_message 1 "An error"
print_message "This is a warning"