def print_dict(d):
    for key, val in d.items():
        print(f"[{key}] => {val}")

d1 = {}
d1["key"] = "value"
d1["Andrew"] = "green"
d1["Anne"] = "red"
d1["John"] = "blue"

print_dict(d1)