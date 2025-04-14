def print_dict(d):
    for key, value in d.items():
        print(f"[{key}] => {value}")

d1 = {}
d1["key"] = "value"
d1["Andrew"] = "green"

print_dict(d1)