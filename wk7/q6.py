#! /usr/bin/env python3

import sys

num_lines = 10
if len(sys.argv) > 1 and sys.argv[1].startswith("-"):
    num_lines = int(sys.argv[1][1:])
    sys.argv.pop(1)

print(num_lines)

for filename in sys.argv[1:]:
    try:
        data = open(filename, "r")
        print(f"==> {filename} <==")

        counter = 0
        for line in data.readlines():
            if counter > num_lines:
                break

            print(line, end="")
            counter += 1
        
        data.close()
    except IOError as e:
        print(f"{sys.argv[0]}: can not open: {e.filename} : {e.strerror}")

