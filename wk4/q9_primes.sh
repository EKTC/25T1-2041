#!/bin/dash

# Same conditions as the other file
if ! [ "$1" -eq "$1" ] 2>/dev/null || [ "$1" -lt 0 ] || [ "$#" -ne 1 ]
then
    echo "Usage: $0 [num]"
    exit 1
fi

i=2


#  The main thing to note about this script is the if statement
# So we run another script in our current file and pass in the arguments it needs
# Which in this case is a number
# 
# We then do not care about the output of our other script
# What we care about are the exit codes
# Remmeber that 0 means success and 1 means fail 
# Think of this as similar to True or False -> True evaluates to 0 and false to 1
# Other languages will have these as different values but for shell unix it is the above
# 
# When we run our program it will give an exit code of 0 or 1
# If its successful we then print the number as we only are successful when its a prime
while [ "$i" -lt "$1" ]
do
    if ./q9_is_prime.sh "$i" > /dev/null;
    then
        echo "$i"
    fi
    i=$((i + 1))
done