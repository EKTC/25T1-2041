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

    # Get the site contents with wget
    # Make it all lower to be easier to extract
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
    
    # Get the tags in sorted order and print
    for tag, counter in sorted(tags_counter.items()):
        print(f"{tag} {counter}")

if __name__ == "__main__":
    main()