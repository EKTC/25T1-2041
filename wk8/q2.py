from collections import Counter
from collections import defaultdict
from collections import OrderedDict

c = Counter()
c["a"] += 1   # index error with a normal dictionary
print(c["a"])

# This will error out 
d = {}
d["a"] += 1
print(d["a"])

# This is the way to do it with a normal dictionary
d1 = {}
if "a" in d1:
    d1["a"] += 1
else:
    d1["a"] = 1
print(d1["a"])

c = defaultdict(list)
c["a"].append("hello")   # index error with a normal dictionary
print(c["a"])

# Maintains order of keys based on insertion
c = OrderedDict()
c["z"] = "COMP1511"
c["a"] = "COMP1521"
c["k"] = "COMP1531"
c["b"] = "COMP2041"
print(c.keys())