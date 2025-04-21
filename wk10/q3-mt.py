#!/usr/bin/env python3


import sys

VOWELS = "aeiou"

# maketrans returns a mapping table for translate to replace specified characters
trans = str.maketrans(VOWELS.upper() + VOWELS.lower(), VOWELS.lower() + VOWELS.upper())
for line in sys.stdin:
    print(line.translate(trans), end="")


