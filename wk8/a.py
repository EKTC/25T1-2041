import re
s = "asdkasd100njs20"

r = re.search(r"(\d+)", s)
p = re.findall(r"(\d+)", s)
print(p)
print(r.group(1))