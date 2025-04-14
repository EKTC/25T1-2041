#! /usr/bin/env python3

# written by Dylan Brotherston
# fetch specified web page and count the HTML tags in them

from collections import Counter
from argparse import ArgumentParser

import requests
from bs4 import BeautifulSoup

def main():

    # Same as before
    parser = ArgumentParser()
    parser.add_argument('-f', '--frequency', action='store_true', help='print tags by frequency')
    parser.add_argument("url", help="url to fetch")
    args = parser.parse_args()

    # Gets the contents from the url
    # So we dont have to run the subprocess
    response = requests.get(args.url)
    webpage = response.text.lower()

    # Soup is a way to represent the HTML document in a more structured way
    soup = BeautifulSoup(webpage, 'html5lib')
    # print(soup)
    # It is then parsed into an object which we can grab
    tags = soup.find_all()
    # List comprehension to create a list with just the tag name
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