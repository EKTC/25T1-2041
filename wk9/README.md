<h1 align="center">Week 9</h1>

<h1>Python Functions Cont.</h1>

###

<h2>List Comprehensions</h2>

- A way to shorten code and works similar to a for loop
- Can be used to create a list based on a condition or set of values
- Example 1: `expr` for `value` in `iterable`
- Example 2: `expr` for `value` in `iterable` if `expr2`

<h2>Lambda</h2>

- Allows creation of small annoymous functions
- `lambda` can be used for higher-order programming - passing functions into others
- `lambda` must be a single expression
- function body cant contain statements such as `while` and `return`
- Overall use for more simple statements or logic

<h2>Other Useful functions </h2>

- `enumerate` returns tuples pairing a count with members of an iterable
- `zip` allows you to interate through more than one iterable container
- `map` calls a function with arguments taken from iterables and returns the functions return value
- `filter` returns elements of an iterable for which the supplied function returns true
- `functools` is a module that provides more functions for higher-order programming

<h1>Assignment 2</h1>

###

- Your goal is to write functionality for this program called **Pied** which acts very similar to the tool `sed`
- `Sed` is complex so for this assignment you are implementing only a few important cmds
- You can only use **python** for this assignment
- Just to note once again the behaviours

<h2>Subset 0</h2>

- Input will be given through stdin
- `Pied` cmd has four options being `q/p/d/s`
- The one cmd line argument in this subset is `-n`

<h3>q - quit cmd</h3>

- `q` will cause `Pied` to exit
- Similar to `sed` doing just the number followed by `q` will print the number of lines specified then quit
- If we try to run the cmd without the `q` it errors out
- We also have the ability to use regex for `Pied` as well
- If there are an infinite number of lines of stdin, limit the cmd to continue till it satisfies the match or condition

```sh
$ seq 1 5 | 2041 pied '3q'
1
2
3

$ seq 10 15 | 2041 pied '/.1/q'
10
11
```

<h3>p - print cmd</h3>

- Prints the input line
- Hence if we had a match with regex we would print that line
- If we dont supply a regex and just `np` where `n` is a random number it will print that line out again instead

<h3>d - delete cmd</h3>

- Deletes the input line it matches to

<h3>s - substitute cmd</h3>

- Acts like the `sed` variant
- Replaces the specified regex on the line
- If you add the `g` modifier at the end it replaces all instances in the line
- Can add the address / number in front to specify the line you want to target
- Such as below where the 5th line is changed

```
$ seq 51 60 | 2041 pied '5s/5/9/g'
51
52
53
54
99
56
57
58
59
60
```

<h3>-n option</h3>

- The option stops input lines being printed by default unless they match
- Note you are meant to use the `p` cmd to get the printing

<h2>Subset 1</h2>

<h3>s - substitute cmd</h3>

- the subset 1 addition is that any non-whitespace character can be used to delimiter the cmd
- So we cannot assume `/` is the delimiter now

<h3>Multiple commands</h3>

- Multiple commands can be chained
- These commands can be separated by a newline or a `;` semicolon

```sh
# deletes the line with value 2
# And then quits on line 4
$ seq 1 5 | 2041 pied '/2/d;4q'
1
3
4
```

<h3>-f - command line option</h3>

- An option that allows `Pied` to read commands from a file and execute them

<h3>Input files</h3>

- Files can be specified on the cmd line to give input to `Pied`
- Will print all the output for each file in the terminal

<h3>Comments & White Space</h3>

- Whitespace can appear before and/or after commands and addresses
- `#` can be used as a comment character

<h1>Tutorial Questions</h1>

<!-- Start of Q  -->
<h2>Q2</h2>
<details> 
<!-- ==========  -->
<summary>Write a Python program, tags.py which given the URL of a web page fetches it by running wget and prints the HTML tags it uses.

The tag should be converted to lower case and printed in alphabetical order with a count of how often each is used.

Don't count closing tags.

Make sure you don't print tags within HTML comments.

```
$ ./tags.py https://www.cse.unsw.edu.au
a 141
body 1
br 14
div 161
em 3
footer 1
form 1
h2 2
h4 3
h5 3
head 1
header 1
hr 3
html 1
img 12
input 5
li 99
link 3
meta 4
noscript 1
p 18
script 14
small 3
span 3
strong 4
title 1
ul 25
```

</summary>

###

```python
#! /usr/bin/env python3

# written by Nasser Malibari and Dylan Brotherston
# fetch specified web page and count the HTML tags in them

import sys, re, subprocess
from collections import Counter

def main():

    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <url>", file=sys.stderr)
        sys.exit(1)

    url = sys.argv[1]

    process = subprocess.run(["wget", "-q", "-O-", url], capture_output=True, text=True)
    webpage = process.stdout.lower()

    # remove comments
    webpage = re.sub(r"<!--.*?-->", "", webpage, flags=re.DOTALL)

    # get all tags
    # note: use of capturing in re.findall returns list of the captured part
    tags = re.findall(r"<\s*(\w+)", webpage)

    # using collections.counter, alternatively can use a dict to count
    tags_counter = Counter()
    for tag in tags:
        tags_counter[tag] += 1

    for tag, counter in sorted(tags_counter.items()):
        print(f"{tag} {counter}")

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
<summary>Add an -f option to tags.py which indicates the tags are to be printed in order of frequency.</summary>

###

```python
#! /usr/bin/env python3

# written by Nasser Malibari and Dylan Brotherston
# fetch specified web page and count the HTML tags in them

import re, subprocess
from collections import Counter
from argparse import ArgumentParser

def main():

    parser = ArgumentParser()
    parser.add_argument('-f', '--frequency', action='store_true', help='print tags by frequency')
    parser.add_argument("url", help="url to fetch")
    args = parser.parse_args()

    process = subprocess.run(["wget", "-q", "-O-", args.url], capture_output=True, text=True)
    webpage = process.stdout.lower()

    # remove comments
    webpage = re.sub(r"<!--.*?-->", "", webpage, flags=re.DOTALL)

    # get all tags
    # note: use of capturing in re.findall returns list of the captured part
    tags = re.findall(r"<\s*(\w+)", webpage)

    # using collections.counter, alternatively can use a dict to count
    tags_counter = Counter()
    for tag in tags:
        tags_counter[tag] += 1

    if args.frequency:
        for tag, counter in reversed(tags_counter.most_common()):
            print(f"{tag} {counter}")
    else:
        for tag, counter in sorted(tags_counter.items()):
            print(f"{tag} {counter}")

if __name__ == "__main__":
    main()
```

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q4</h2>
<details> 
<!-- ==========  -->
<summary>Modify tags.py to use the requests and beautifulsoup4 modules.</summary>

###

```python
#! /usr/bin/env python3

# written by Dylan Brotherston
# fetch specified web page and count the HTML tags in them

from collections import Counter
from argparse import ArgumentParser

import requests
from bs4 import BeautifulSoup

def main():

    parser = ArgumentParser()
    parser.add_argument('-f', '--frequency', action='store_true', help='print tags by frequency')
    parser.add_argument("url", help="url to fetch")
    args = parser.parse_args()

    response = requests.get(args.url)
    webpage = response.text.lower()

    soup = BeautifulSoup(webpage, 'html5lib')

    tags = soup.find_all()
    names = [tag.name for tag in tags]

    tags_counter = Counter()
    for tag in names:
        tags_counter[tag] += 1

    if args.frequency:
        for tag, counter in reversed(tags_counter.most_common()):
            print(f"{tag} {counter}")
    else:
        for tag, counter in sorted(tags_counter.items()):
            print(f"{tag} {counter}")

if __name__ == "__main__":
    main()
```

<!-- End of Q  -->
</details> 
<!--  =======  -->
