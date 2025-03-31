#! /usr/bin/env python3 

import re

line = "ABADA"

m = re.findall(r"A", line)
print(m)

print("<====================>")

line = "Ice Water"
m = re.search(r"(\w+) (\w+)", line)
print(m.string)
print(m.re.pattern)
print(m.span())
print(m.group(0))
print(m.group(1))
print(m.group(2))


