#!/usr/bin/env python3

import sys
import re

addr = sys.argv[1]
# print(addr)
try:
    # address is a line number
    address = int(addr)
except ValueError:
    # address is a regex (remove `/` from start and end)
    address = re.compile(addr[1:-1])

for line_num, contents in enumerate(sys.stdin, start=1):
    # Remove trailing the new line if exists
    if contents[-1] == "\n":
        contents == contents[:-1]
    
    # address is an integer so check the line number
    # isinstance is a function that checks if a variable is a type
    if isinstance(address, int):
        if address == line_num:
            break
    # address is a regex so check the line content
    else:
        if address.search(contents):
            break

    # if we aren't on a line that matches the address, print the line
    print(line_num)

print(line_num)
