<h1 align="center">Week 8</h1>

<h1>Python Regex</h1>
<h2>Functions in re</h2>

```python
# search for a *regex* match within *string*
# return object with information about match or `None` if match fails
# optional parameter flags modifies matching,
# e.g. make matching case-insensitive with: `flags=re.I`
re.search(regex, string, flags)

# only match at start of string
# same as `re.search` stating with `^`
re.match(regex, string, flags)

# only match the full string
# same as `re.search` stating with `^` and ending with `$`
re.fullmatch(regex, string, flags)

# return *string* with anywhere *regex* matches, substituted by *replacement*
# optional parameter *count*, if non-zero, sets maximum number of substitutions
re.sub(regex, replacement, string, count, flags)

# return all non-overlapping matches of pattern in string
# if pattern contains () return part matched by ()
# if pattern contains multiple () return tuple
re.findall(regex, string, flags)

# Split *string* everywhere *regex* matches
# optional parameter *maxsplit*, if non-zero, set maximum number of splits
re.split(regex, string, maxsplit, flags)
```

<h2>Python Character Classes</h2>

- \d matches any digit, for ASCII: [0-9]
- \D matches any non-digit, for ASCII: [^0-9]
- \w matches any word char, for ASCII: [a-zA-Z_0-9]
- \W matches any non-word char, for ASCII: [^a-zA-Z_0-9]
- \s matches any whitespace, for ASCII: [ \t\n\r\f]
- \S matches any non-whitespace, for ASCII: [^ \t\n\r\f]
- \b matches at a word boundary
- \B matches except at a word boundary
- \A matches at the start of the string, same as ^
- \Z matches at the end of the string, same as $

<h2>Raw Strings</h2>

- Python raw-string prefixed with an `r`
- Backslashes have no special meaning except before quotes

<h2>Capture Groups & Back Referencing</h2>

- Brackets used for grouping
- Can grab specific regex matches
- \number can be used to reference capture groups such as for re.sub
- Can also back reference with \number such as `r'^(\d+) (\1)$'`
- Which will match 2 digits as the regex is `\d+`

<h2>Non-Capturing Groups</h2>

- `(?:...)` is a non-capturing group
- `(...)` has the same behaviour just you cant access it / store it for later
- Use for more cleaner less confusing regex whilst improving performance as we do not have to store the match

<h2>Greedy versus non-Greedy Pattern Matching</h2>

- Default semantics for pattern matching is greedy
  - Starts match as early as possible and matches for as long as possible
- `?` operator changes pattern matching to non-greedy
  - Starts match the first place it can succeed and makes the match as short as possible

<h1>Python Functions</h1>
<h2>Defining Functions</h2>
- Define a function as below:

```python
def polly(x, a, b, c):
    return a * x ** 2 + b * x + c
```

- We can call the function in different ways

```sh
- Postional arguments: polly(3, 5, -3, 6)
- Keyword arguments: polly(a=5, c=6, b=-3, x=3)
- Both: polly(3, c=6, b=-3, a=5)
```

<h2>Default Values for Functions</h2>

- We can assign default values to function parameters

```python
def add(x, y=1):
    return x + y
```

- So if we do not give a value for `y` it will just evaluate `y` as `1` in this case

```sh
>>> add(1)
2
>>> add(1, 2)
3
```

<h1>Tutorial Questions</h1>
<!-- Start of Q  -->
<h2>Q2</h2>
<details> 
<!-- ==========  -->
<summary>What other useful types are available with Python's standard library?</summary>

###

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q3</h2>
<details> 
<!-- ==========  -->
<summary>Write a Python function `print_dict()` that displays the contents of a dict in the format below:

```sh
[key] => value
[Andrew] => green
[Anne] => red
[John] => blue
```

</summary>

###

```python
def print_dict(d):
    for key, val in d.items():
        print(f"[{key}] => {val}")
```

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q4</h2>
<details> 
<!-- ==========  -->
<summary>Write a Python program, times.py which prints a table of multiplications.

Your program will be given the dimension of the table and the width of the columns to be printed. For example:

```sh
$ ./times.py 5 5 5
    1     2     3     4     5
    2     4     6     8    10
    3     6     9    12    15
    4     8    12    16    20
    5    10    15    20    25

$ ./times.py 10 10 3
  1   2   3   4   5   6   7   8   9  10
  2   4   6   8  10  12  14  16  18  20
  3   6   9  12  15  18  21  24  27  30
  4   8  12  16  20  24  28  32  36  40
  5  10  15  20  25  30  35  40  45  50
  6  12  18  24  30  36  42  48  54  60
  7  14  21  28  35  42  49  56  63  70
  8  16  24  32  40  48  56  64  72  80
  9  18  27  36  45  54  63  72  81  90
 10  20  30  40  50  60  70  80  90 100
```

</summary>

###

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q5</h2>
<details> 
<!-- ==========  -->
<summary>Write a Python program missing_words.py which given two files as arguments prints, in sorted order, all the words found in file1 but not file2.

You can assume words occur one per line in each file.</summary>

###

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q6</h2>
<details> 
<!-- ==========  -->
<summary>Example</summary>

###

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q7</h2>
<details> 
<!-- ==========  -->
<summary>Example</summary>

###

<!-- End of Q  -->
</details> 
<!--  =======  -->
