#! /usr/bin/env python3

import sys

num_lines = 10

# Checking if an arg was supplied or not
# Remember to cut off the `-` at the front
if len(sys.argv) > 1 and sys.argv[1].startswith("-"):
    num_lines = int(sys.argv[1][1:])

print(num_lines)

# Print the lines from the file till we reach the required 
# number of lines.
counter = 1
for line in sys.stdin:
    if counter > num_lines:
        break
    
    # Default behaviour is to have a newline, so we can change it with end=""
    print(line, end="")
    counter += 1
