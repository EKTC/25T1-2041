<h1 align="center">Week 10</h1>

<h1>Tutorial Questions</h1>

<!-- Start of Q  -->
<h2>Q2</h2>
<details> 
<!-- ==========  -->
<summary>Write a Python program, until.py which takes as an argument either a line number (e.g. 3) or a regular expression (e.g. /.[13579]/) and prints all lines given to it by standard input until the given line number, or the first line matching the regular expression. For example:

```
seq 1 5 | ./until.py 3
1
2
3

seq 1 20 | ./until.py /.3/
1
2
3
4
5
6
7
8
9
10
11
12
13
```

</summary>

###

```python
#!/usr/bin/env python3

from argparse import ArgumentParser
from re import compile
import sys

def main():
    # Overkill? yes.
    parser = ArgumentParser()
    parser.add_argument('address')
    args = parser.parse_args()

    try:
        # address is a line number
        address = int(args.address)
    except ValueError:
        # address is a regex (remove `/` from start and end)
        address = compile(args.address[1:-1])

    for line_number, line_content in enumerate(sys.stdin, start=1):
        # remove trailing newline if it exists
        if line_content[-1] == '\n':
            line_content = line_content[:-1]

        # address is an integer so check the line number
        if isinstance(address, int):
            if address == line_number:
                break
        # address is a regex so check the line content
        else:
            if address.search(line_content):
                break

        # if we aren't on a line that matches the address, print the line
        print(line_content)

    # once we've found a line that matches the address, print the line
    print(line_content)


if __name__ == "__main__":
    main()
```

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q3</h2>
<details> 
<!-- ==========  -->
<summary>Write a Python program that maps all lower-case vowels (a,e,i,o,u) in its standard input into their upper-case equivalents and, at the same time, maps all upper-case vowels (A, E, I, O, U) into their lower-case equivalents.
The following shows an example input/output pair for this program:

###

Input:
This is some boring text.
A little foolish perhaps?

Output
ThIs Is sOmE bOrIng tExt.
a lIttlE fOOlIsh pErhAps?

</summary>

###

```python
#!/usr/bin/env python3


import sys

VOWELS = "aeiou"

def main():
    trans = str.maketrans(VOWELS.upper() + VOWELS.lower(), VOWELS.lower() + VOWELS.upper())
    for line in sys.stdin:
        print(line.translate(trans), end="")


if __name__ == '__main__':
    main()
```

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q6</h2>
<details> 
<!-- ==========  -->
<summary>
The Perl programming language a handful of useful functions.
Write a Python module perl.py that that contains the following functions:

###

chomp - The Perl function chomp removes a single newline from the end of a string (if there is one).

qw - The Perl function qw splits a string into a list of words.

die - The Perl function die prints an error message and exits the program.

</summary>

###

```python
import sys

def chomp(string):
    if string[-1] == '\n':
        return string[:-1]
    else:
        return string

def qw(string):
    return string.split()

def die(message):
    print(sys.argv[0], "Error", message, sep=": ", file=sys.stderr)
    sys.exit(1)
```

<!-- End of Q  -->
</details> 
<!--  =======  -->

<h1>Revision Questions</h1>

<!-- Start of Q  -->
<h2>Q2</h2>
<details> 
<!-- ==========  -->
<summary>

Write a shell script called check that looks for duplicated student ids in a file of marks for a particular subject. The file consists of lines in the following format:

```
2233445 David Smith 80
2155443 Peter Smith 73
2244668 Anne Smith 98
2198765 Linda Smith 65
```

The output should be a list of student ids that occur 2+ times, separated by newlines. (i.e. any student id that occurs more than once should be displayed on a line by itself on the standard output).

</summary>

###

```sh
#!/bin/sh

cut -d' ' -f1 < Marks | sort | uniq -c | egrep -v '^ *1 ' | sed -e 's/^.* //'
```

<!-- End of Q  -->
</details> 
<!--  =======  -->
