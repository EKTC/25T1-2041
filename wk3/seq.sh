#! /usr/bin/env dash

# First we want to put all the arguments into variables so we can use
# We need to notice that there are 3 cases based on the different args given
# So we want to deal with each case
# Case 1: 1 arg
# Case 2: 2 args
# Case 3: 3 args

# # Three variables that are possible
first=""
last=""
increment=""

# We need to remember  that if we do not get the three cases then our logic breaks
# So we need an error check which we can send with `>& 2``
if [ "$#" -eq 1 ]
then
    first=1
    last="$1"
    increment=1
elif [ "$#" -eq 2 ]
then
    first="$1"
    last="$2"
    increment=1
elif [ "$#" -eq 3 ]
then
    first="$1"
    last="$2"
    increment="$3"
else
    echo "Usage: $0 [FIRST [INCREMENT]] LAST" >& 2
    exit 1
fi

# We can test our variables are assigned here
echo "$first | $last | $increment"

# Some other error cases / edge cases we need to worry about
# 1) What if we are given the integers as strings instead?
# 2) What if we are given a negative number instead of a positive one for the INCREMENT?
# 3) What if the LAST value is smaller than the FIRST?

# This a simple loop to print all the numbers in the sequence
# We want to do arithmetic to increase the numbers for each sequence step
curr="$first"
while [ "$curr" -le "$last" ]
do
    echo "$curr"
    curr=$((curr + increment))
done

# Some things to note are that we have to be careful about spacing between the conditions, otherwise it may break
# We need to use comparisons such as -eq and -le instead of = or == or < we see in other languages
# Understand that there are specific shell variables that have certain properties such as $# which is number of args in this case
# To run the script when we first make the file, we normally dont have permissions to run, so we need to chmod +x filename so we can set the permissions to run