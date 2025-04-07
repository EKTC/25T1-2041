#! /usr/bin/env python3

import sys

print(sys.argv[0])

num_lines = 10
if len(sys.argv) == 2 and sys.argv[1].startswith("-"):
    num_lines = int(sys.argv[1][1:])

print(num_lines)

counter = 0
for line in sys.stdin:
    if counter > num_lines:
        break

    print(line, end="")
    counter += 1