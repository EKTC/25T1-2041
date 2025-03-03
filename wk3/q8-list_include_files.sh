#!/bin/dash

# This is globbing to grab all the files in the directory that have .c at the end
# This means we will get all c files
#
# We then print all the filenames for each section
# Then we want to find all the lines which have #include which we can use a grep command for piping in the file we want to search
# Once we have all the lines we can use sed to remove all the unwanted parts of the lines which is everything before and after the .h filenames
# So to remove everything after we want to match one of the ending characters being > or " followed with any number of characters after till the end. Remember to anchor the end to ensure we match everything. We then just replace it with nothing. Note we do not need the `g` option for the sed command as each line gets piped in as a separate argument to the sed cmd
# The sed cmd to remove all the characters in front is to first match the start of the string and any number of characters till we hit the starting brace which is either " or <. To format better we can replace with \t which is a tab character
for file in *.c
do
    echo "$file includes:"
    grep -E '^#include' "$file" | # First step grabs all the lines that have a #incluide
    sed -E 's/[">][^">]*$//' | # We then want to get rid of everything after the .h
    sed -E 's/^.*[<"]/\t/'  # We then get rid of the start so we just have the filename
done

# Note we can embed the filter commands such as grep, cut, sed in our files as well and use the result
# Globbing is a good way to grab files within the directory
# Best way to write filters or shell cmds is to do it part by part and break it down. So here I can demonstrate us getting the filenames first and checking its all .c files only. Then it would be the grep cmd and then the subsequent sed cmds