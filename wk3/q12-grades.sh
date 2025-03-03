#!/bin/dash

# Since some inputs have additional comments such as "ok"
# This is not relevant to the id & mark we are aiming to check
# So we can use an underscore (_) which is denoted as a throwaway variable for extra things
while read -r id mark _
do
    # echo "$id | $mark" # Checking if its processing the data as intended
    echo -n "$id "

    # To check if smth is a number we can use -eq
    # -eq only works on numbers and will error out if its a string
    # We also want to check its a valid number
    # Which in this case is a number ranging from 0 to 100
    # 
    # An important thing is that when we do comparisons and it is illegal, we wil lget an error msg
    # These will disrupt our output so we need to send it somewhere
    # /dev/null is like an empty void you can send stuff to if its unwanted
    #
    # The main logic is we compare the mark with breakpoints to print the corresponding
    # Grade, if its invalid we have a case for it being ??
    if [ "$mark" -eq "$mark" ] 2> /dev/null && [ "$mark" -ge 0 ] && [ "$mark" -le 100 ]
    then
        if [ "$mark" -lt 50 ] 
        then
            echo FL
        elif [ "$mark" -lt 65 ]
        then
            echo PS
        elif [ "$mark" -lt 75 ]
        then
            echo CR
        elif [ "$mark" -lt 85 ]
        then
            echo DN
        else
            echo HD
        fi
    else
        echo "?? ($mark)"
    fi
done