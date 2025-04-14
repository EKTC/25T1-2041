#!/usr/bin/env python3
import sys, re, subprocess
for url in sys.argv[1:]:
    p = subprocess.run(f"wget -q -O- {url}", shell=True, capture_output=True, text=True)
    contents = p.stdout

    for n in re.findall(r"[\d  -]+", contents):
        n = re.sub(r"\D", "", n)
        if len(n) >= 8 and len(n) <= 15:
            print(n)
