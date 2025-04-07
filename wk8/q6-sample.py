#!/usr/bin/env python3
# written by andrewt@cse.unsw.edu.au for COMP2041
# count lines of C source code
from glob import glob

def main():
    total = 0
    # Glob and then open each file
    for filename in glob("*.[ch]"):
        with open(filename) as f:
            lines = f.readlines()
            n_lines = len(lines)
            # Allign the items for the lines to take up to 7 characters
            print(f"{n_lines:7} {filename}")
            total += n_lines
    print(f"{total:7} total")

if __name__ == "__main__":
    main()