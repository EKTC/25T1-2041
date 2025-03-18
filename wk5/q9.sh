#!/bin/dash

print_message() {
    case "$#" in 
        1)
            echo "$0: warning $1" 
            ;;
        2) 
            echo "$0: error $2" 
            exit $1
            ;;
        *)
            echo "$0: Usage [Optional Exit Code] [Message]"
            ;;
    esac
}

# Note we are making an assumption that if there is an exit code
# It is the first argument
echo "This will print a warning"
print_message "This is a warning"

echo "This will print an error"
print_message 1 "This is an error"