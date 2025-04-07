#! /usr/bin/env python3 

import re

text = "The sky is blue"
x = re.search(r"blue", text)

# Important to note is that `x` here is an object
print(x)

# Another example can be matching emails
# We have the 'r' in front to make it a raw string so it doesnt escape / expand the backslashes
email = "cs2041@cse.unsw.edu.au"
m = re.search(r".+@.+\..+", email)
print(m.string)

fake_email = "cs2041@csecom"
m = re.search(r"^.+@.+\..+", fake_email, re.IGNORECASE)
print(m)

