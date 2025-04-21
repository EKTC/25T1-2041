#!/bin/sh

# cut -d' ' -f1 < Marks ... extracts the student ID from each line

# sort | uniq -c ... sorts and counts the occurrences of each ID

# IDs that occur once will be on a line that begins with spaces followed by 1 followed by a TAB

# grep -v '^ *1 ' removes such lines, leaving only IDs that occur multiple times

# sed -e 's/^.* //' gets rid of the counts that uniq -c placed at the start of each line

cut -d' ' -f1 < names.txt | sort | uniq -c | grep -Ev '^ *1 ' | sed -E 's/^.* //'