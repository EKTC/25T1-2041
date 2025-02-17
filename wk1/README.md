<h1 align="center">Week 1</h1>

<details>
<summary><h3>Q: What is an operating system?</h3></summary>
An operating system is a piece of software that manages the hardware of a computer and provides an interface to the programs that run on the computer.
</details>

<details>
<summary><h3>Q: Write Regex to match C preprocessor commands in a C program source file.</h3></summary>

###

- C preprocessor commands are the lines of code that have a `#` at the front such as #define
- Therefore we would just search for lines that start with the `#`
- Remember we can anchor our search so the matches must start with the `#`

###

```
^#
```

</details>

<details>
<summary><h3>Q: Write Regext to match all the lines in a C program except preprocessor commands.</h3></summary>

###

- This is the inverse of the previous one, so we want everything else but the lines that start with `#`
- Thus we can match that the start is not a hash. But if we do that way, by condition it requires one character to match
- Hence we add another condition ontop to match empty lines specifically as they have no characters at all

###

```
^[^#]|^$
```

</details>

<details>
<summary><h3>Q: Write Regex to match all lines in a C program with trailing white space (one or more white space at the end of line).</h3></summary>

###

- Here we just want to find any line where theres white space at the end
- So we can use `\s` which matches any whitespace character, followed by anchoring at the end with `$` as we do not want anything else after

###

```
\s$
```

</details>

<details>
<summary><h3>Q: Write Regex to match the names "Barry", "Harry", "Larry" and "Parry".</h3></summary>

###

- We can use a bracket expression as only the first letter is different for the required names
- So we dont need to write a seperate expression for each such as breaking it up with `Harry|Larry` etc

###

```
[BHLP]arry
```

</details>

<details>
<summary><h3>Q: Write Regex to match a string containing the word "hello" followed, some time later, by the word "world".</h3></summary>

###

- We do not care about the start or end of the string as much so no need to anchor
- What we want is a string of `hello` followed by `world` anytime after
- We do not mind whatever character fills it in between of if there are any thus we can do `.*` which means 0 or more of any characters could be in between the string

###

```
hello.*world
```

</details>

<details>
<summary><h3>Q: Write Regex to match the word "calendar" and mis-spellings where 'a' is replaced with 'e' or vice-versa.</h3></summary>

###

- We want to match variations of "calendar" where in any place theres an `a or e` it is the other
- We can use the bracket expression to match either one in the places `a or e` occurs
- So this matches the literal strings calandar, calander, calendar, calender, celandar, celander, celendar, celender

###

```
c[ae]l[ae]nd[ae]r
```

</details>

<details>
<summary><h3>Q: Write Regex to match a list of positive integers separated by commas, e.g. 2,4,8,16,32</h3></summary>

###

- A bit more involved than the previous ones, something of note is that `0` cannot be at the start of the number except for itself
- Starting off we can match the first number that will not have a comma in front of it
- We can set a range with the bracket expression for the range of numbers we could see in each position
- The first digit cannot be a `0` unless it is only `0` so our range is only `1-9`
- Following that up we can have any number of trailing digits such as for two-digit, three-digit and more, so we use `[0-9]*` as there can be 0 or more repetitions for the number
- We then combine it with an expression thats looking for a comma followed by grouped digits which can be `0` or more

###

```
([1-9][0-9]*|0)(,([1-9][0-9]*|0))*
```

</details>

<details>
<summary><h3>Q: Write Regex to match a C string whose last character is newline.</h3></summary>

###

- We want to match a string that ends with a new line `\n`
- So our start is finding the `"`
- We then want to match any set of characters following that, and we use `[^"]` as sometimes using `.*` matches too much in some cases
- We then follow it up with the newline character and the final `"`
- Note regex does not deal with escaped quotes
- Also note we need to escape the new line character which we use `\`

###

```
"[^"]*\\n"
```

</details>

<details>
<summary><h3>
Q: Why does it take a while to run `grep -E hello`
</h3></summary>

###

- When running grep, you can specify some sort of input to filter
- Otherwise it waits for stdin to apply the filter
- On a successful match it prints out the matched expression in terminal

</details>

<details>
<summary><h3>
Q: Why won't this command work `grep -E int main program.c`
</h3></summary>

###

- `grep -E` will try to scan the files `main` & `program.c` for `int`
- If `main` does not exist it would display an error that the file does not exist
- The shell treats each space as an argument and only the first one after the `-E` is what you want to filter
- To fix we would do `grep -E 'int main' program.c`

</details>

<details>
<summary><h3>
S: Try out the command `man 1 grep`
</h3></summary>

###

- Input the above command to get used to using the man pages
- Man pages provide useful information about the command such as the options, this may be more important if the exam is closed book as in previous terms
- The two options that come to mind are `-v` which means the non-matching lines are printed instead
- The other option is `-i` which ignores upper/lower case

</details>

<details>
<summary><h3>
Q: What does the command `grep -Ev .` print and why? Can you do the same without the -v option
</h3></summary>

###

- The pattern `.` matches any character
- However the option `-v` means grep will print out the lines that do not match the pattern
- Hence it will print out all the empty lines
- To do so without the `-v` option we can do something like `grep -E '^$'`

</details>

<details>
<summary><h3>
Q: This regular expression `[0-9]*.[0-9]*` is intended to match floating point numbers such as '42.5'
Is it appropriate?
</h3></summary>

###

- The expression above will match a zero or more digits, followed by any character and then zero or more digits
- It also allows for leading zeroes before other digits which is undesireable
- A better expression would be `(0|[1-9][0-9]*)\.([0-9]*[1-9]|0)`
- The explanation is that the first group selects either `0` or any number that is not zero
- We also end the same as well
- To escape the `.` we need a `\`

</details>
