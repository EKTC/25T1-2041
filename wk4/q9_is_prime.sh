#!/bin/dash

# Check for valid conditions
if ! [ "$1" -eq "$1" ] 2>/dev/null || [ "$1" -lt 0 ] || [ "$#" -ne 1 ]
then
    echo "Usage: $0 [num]"
    exit 1
fi

# Special case of 1 -> not prime
if [ "$1" -eq 1 ]
then
    echo "$1 is not prime"  
    exit 1
fi

# Loop thru all the numbers till we reach the limit
# Check if `i` is a factor of the number 
i=2
while [ "$i" -lt "$1" ]
do
    if [ $(($1 % i)) -eq 0 ] 
    then
        echo "$1 is not prime"
        exit 1
    fi
    i=$((i + 1))
done

echo "$1" is prime
exit 0
