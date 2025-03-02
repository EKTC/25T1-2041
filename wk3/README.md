<h1 align="center">Week 3</h1>

<h1>Shell</h1>
<h2>Basics</h2>

###

- Shells are command interpreters -> we can execute commands which cause programs to run
- `bash` is the most popular but within the course we will use `dash`
- `dash` is POSIX standard shell (meaning all shells will have these features) whilst `bash` implement a superset of POSIX shell
- Transformations on shell input lines follow a certain order as mentionned in the lecture notes

<h2>echo</h2>

###

- `echo` prints arguments to `stdout`
- `-n` is an option that makes `echo` not output a trailing newline
- `-e` enables interpretation of backslash escapese (default in dash)
- `echo -e '\n'` will print a new line in terminal but `echo '\n'` will not

<h1>Shell Rules</h1>
<h2>Shell Variables</h2>

###

- Untyped, always considered as strings -> 1 becomes "1"
- Shell variables are not declared
- Dont need initialisation -> intial value is empty string
- one scope -> all global variables
- `$name` replaced with value `name`
- `name=value` for variable assignment

<h2>$ (cmd) - command expressions</h2>

###

- `$ (cmd)` evaluates to running `cmd`
- stdout is captured from `cmd`

<h2>'' - single quotes </h2>

###

- Groups characters into a single word
- No characters interpreted specially inside
- Variables, commands and arithmetic not expanded
- Globbing and word-splitting does not occur within double quotes
- Single quote cannot occur within single quotes

<h2>"" - double quotes </h2>

###

- Also groups characters into a single word
- Unlike single quotes, double quotes does expand and allow for special interpretation
- Variables, cmds and arithmetic are expanded
- Backslash can be used to escape
- Some characters not specially interpreted
- Globbing and word-splitting does not occur

<h2><< - here documents </h2>

###

- Specify a word and until that word is seen again, take in multi-line input
- Has expansions and rules like double quotes

<h2>Arithmetic</h2>

###

- `$ ( (expr) )` is evaluated as an arithmetic expression
- Uses C-like maths, replacing the result
- Shell arithmetic is slow due to conversion to/from strings

<h2>Word Splitting</h2>

###

- Some rules related to word-splitting and the cmd `sys.argv`
- If empty string then does not count unless in double quotes
- If arguments are in single quotes, it is separated based on the spaces
- If in double quotes it will be treated as one

<h2>Pathname Globbing</h2>

###

- `*?[]!` allows pathname matching, similar to regex but not as powerful
- `*` matches 0 or more of any character like regex `.*`
- `?` matches any 1 character like regex
- `[characters]` matches 1 of `characters`
- `[!characters]` matches 1 of not in `characters`

<h2>I/O Redirection</h2>

###

- `> file` -> send stdout to `file`
- `>> file` -> append stdout to `file`
- `2> file` -> send stderr to `file`
- `> file 2>&1` -> send stderr + stdout to `file`

<h2>Pipelines</h2>

###

- `c1 | c2 | c3`
- Sends the result of `c1` to `c2` and so forth
- Changes to variables in pipeline are lost, think of it as changing scope, each piped command has its own subshell

<h1>Tutorial Questions </h1>

<h2>Q1</h2>

###

<details> <!-- Start of Q  -->
<summary>What will be the result of the following echo cmds</summary>

###

<details> <!-- Start of Block 1  -->
<summary>a) echo a   b   c</summary>

###

- Spaces between arguments are not preserved
- So echo will separate with only one space

```
$ echo a   b   c
a b c
```

</details> <!-- End of Block 1  -->

<details> 
<summary>b) echo "a   b   c"</summary>

###

- Spaces are preserved because of the double quotes
- Acts as a single argument

```
echo "a   b   c"
a   b   c
```

</details>

<details> 
<summary>b) echo "a   b   c"</summary>

###

- Spaces are preserved because of the double quotes
- Acts as a single argument

```
echo "a   b   c"
a   b   c
```

</details>

<details> 
<summary>c) echo $y</summary>

###

- Earlier we defined a shell variable of `y='Y Y'`, so it expands into `Y Y`
- Will expand into two arguments

```
echo $y
Y Y
```

</details>

<details> 
<summary>d) echo x$x</summary>

###

- `$x` expands into `2` which is followed by an `x`

```
echo x$x
x2
```

</details>

<details> 
<summary>e) echo $xx</summary>

###

- The command will try and expand the variable reference of `xx`
- Since it was not defined and there was no such variable, it expands to an empty string

```
echo $xx

```

</details>

<details> 
<summary>f) echo ${x}x</summary>

###

- `${x}` expands to `2` and letter `x` to follow

```
echo ${x}x
2x
```

</details>

<details> 
<summary>g) echo "$y"</summary>

###

- Expands into one argument due to the double quotes, unlike the other example before
- Variable expansion because it is double quotes

```
echo "$y"
Y Y
```

</details>

<details> 
<summary>h) echo '$y'</summary>

###

- Single quotes prevent variable expansion
- So it just prints the contents of the string

```
echo '$y'
$y
```

</details>

<details> 
<summary>i) echo $($y)</summary>

###

- `$y` expands to `Y Y`
- This is then executed because it is in the `$()`
- An error message follows as there is no command `Y`

```
echo $($y)
Y: command not found
```

</details>

<details> 
<summary>j) echo $($z)</summary>

###

- `$z` expands to `ls`
- This is then executed as a command due to being in `$()`
- This gives the names of the files in the directory which is `a`, `b`, `c`
- These are all separate arguments

```
echo $($z)
a b c
```

</details>

<details> 
<summary>k) echo $(echo a b c)</summary>

###

- The inner `echo` executes giving `a b c`
- This is passed onto the outer `echo` which it prints to stdout

```
echo $(echo a b c)
a b c
```

</details>

<!-- End of Q  -->
</details> 
<!--  =======  -->

<h2>Q2</h2>
<!-- Start of Q  -->
<details> 
<!-- ==========  -->
<summary>Given a program to give information about the command-line arguments. What will the following commands

```
#!/usr/bin/env python3
from sys import argv

def main():
    print(f"#args = {len(argv) - 1}")
    for index, arg in enumerate(argv[1:], 1):
        print(f'arg[{index}] = "{arg}"')

if __name__ == '__main__':
    main()

# Output
$ ./args a b c
#args = 3
arg[1] = "a"
arg[2] = "b"
arg[3] = "c"
$ args "Hello there"
#args = 1
arg[1] = "Hello there"
```

</summary>

###

<details> 
<summary>a) ./args x y   z</summary>

- Due to no double quotes, it is treated as 3 separate arguments and does not take into account the whitespace

```
./args x y   z
#args = 3
arg[1] = "x"
arg[2] = "y"
arg[3] = "z"
```

</details>

<details> 
<summary>b) ./args $(ls)</summary>

- We run `ls` which gives `a b c`
- These are then sent to the `args` which splits it into separate arguments

```
./args $(ls)
#args = 3
arg[1] = "a"
arg[2] = "b"
arg[3] = "c"
```

</details>

<details> 
<summary>c) ./args $y</summary>

- `$y` expands to `Y Y`
- The shell then splits the line into words, so we have 2 arguments each being `Y`

```
./args $y
#args = 2
arg[1] = "Y"
arg[2] = "Y"
```

</details>

<details> 
<summary>d) ./args "$y"</summary>

- `$y` expands to `Y Y`
- However as it is in double quotes, it expands the variable but also keeps the spaces / makes it one string
- Thus we only have 1 argument `Y Y`

```
./args "$y"
#args = 1
arg[1] = "Y Y"
```

</details>

<details> 
<summary>e) ./args $(echo "$y")</summary>

- The command expands to `Y Y`
- But since backquotes `()` do not have a grouping function the args are separated into 2 `Y's`

```
./args $(echo $y)
#args = 2
arg[1] = "Y"
arg[2] = "Y"
```

</details>

<details> 
<summary>f) ./args $x$x$x</summary>

- `$x` expands to `2` which is appended 3 times
- So we only have one arg of `222`

```
./args $x$x$x
#args = 1
arg[1] = "222"
```

</details>

<details> 
<summary>g) ./args $x$y</summary>

- `$x` expands to `2`
- `$y` expands to `Y Y`
- These are concated as `2Y Y` which is then split by the shell
- So we have two arguments being `2Y` and `Y`

```
./args $x$y
#args = 2
arg[1] = "2Y"
arg[2] = "Y"
```

</details>

<details> 
<summary>h) ./args $xy</summary>

- There is no variable called `xy`
- So it will expand to an empty string which when given to args, means nothing
- So we get 0 args

```
./args $xy
#args = 0
```

</details>

<!-- End of Q  -->
</details> 
<!--  =======  -->
