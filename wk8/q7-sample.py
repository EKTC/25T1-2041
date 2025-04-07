#!/usr/bin/env python3

import sys, re, subprocess

def main():
    for url in sys.argv[1:]:
        # Use subproccess to run the wget command
        # -q means quiet except content, -O means to stdout
        # shell=true means to run the cmd through dash / bash
        # capture_output=True means to capture the output and store it in stdout
        # text=True means to interpret it as a string
        process = subprocess.run(f"wget -q -O- {url}", shell=True, capture_output=True, text=True)
        # Get the stdout of the cmd
        webpage = process.stdout
        # Matches any digit, space and hyphen sequence
        for number in re.findall(r'[\d \-]+', webpage):
            # Removes all non-digit characters with empty string
            number = re.sub(r'\D', '', number)
            # Phone numbers are around this length so we want to filter those out
            if len(number) >= 8 and len(number) <= 15:
                print(number)

if __name__ == "__main__":
    main()