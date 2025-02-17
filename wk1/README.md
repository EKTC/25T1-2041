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
```^#
```
</details>
