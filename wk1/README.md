<h1 align="center">Week 1</h1>

<details>
<summary><h3>Q: What is an operating system?</h3></summary>
An operating system is a piece of software that manages the hardware of a computer and provides an interface to the programs that run on the computer.
</details>

<details>
<summary><h3>Q: Write Regex to match C preprocessor commands in a C program source file.</h3></summary>

###

- C preprocessor commands are the lines of code that have a # at the front such as #define
- Therefore we would just search for lines that start with the #
- Remember we can anchor our search so the matches must start with the #

###

```
^#
```

</details>

<details>
<summary><h3>Q: All the lines in a C program except preprocessor commands.</h3></summary>

###

- This is the inverse of the previous one, so we want everything else but the # lines
- Thus we can match that the start is not a hash. But if we do that way, by condition it requires one character to match
- Hence we add another condition ontop to match empty lines specifically as they have no characters at all

###

```
^[^#]|^$
```

</details>

<details>
<summary><h3>Q: All lines in a C program with trailing white space (one or more white space at the end of line).</h3></summary>

###

- Here we just want to find any line where theres white space at the end
- So we can use `\s` which matches any whitespace character, followed by anchoring at the end with `$` as we do not want anything else after

###

```
\s$
```

</details>

<details>
<summary><h3>Q: The names "Barry", "Harry", "Larry" and "Parry".</h3></summary>

###

- We can use a bracket expression as only the first letter is different for the required names
- So we dont need to write a seperate expression for each such as breaking it up with `Harry|Larry` etc

###

```
[BHLP]arry
```

</details>
