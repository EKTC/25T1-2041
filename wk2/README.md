<h1 align="center">Week 2</h1>

<h1>Filters</h1>
<h2>wc</h2>

###

- wc summarises its input as a single line
- By default, wc prints the number of line, words, characters in its input
- `-c` print the number of characters
- `-w` print the number of words
- `-l` print the number of lines only
- Note that the default shows information of all 3 options listed above, but sometimes we only want one specifically

<h2>tr</h2>

###

- Reads and writes characters, does not deal with lines
- Can do mapping of characters to others in the format `tr sourceChars destChars`
- `tr` command only uses stdin and not files, so we need to pipe in input from a file `< filename.txt`
- There are someshort hand methods for lists of characters such as `a-z` being all the lowercase letters
- `-c` map all bytes not occurring in `sourceChars` which means the complement
- `-s` removes adjacent repeated characters out (only copy the first)
- `-d` delete all characters in sourceChars (no destChars)
- Think of `tr` as translating to something and the option `-d` is like translating something to nothing

<h2>head / tail</h2>

###

- head prints the first `n` lines (10 is default)
- tail prints the last `n` lines (10 is default)
- `-n` is the option to specify the number of lines
- We can get a range of numbers by combining the head and tail command
- For example `head -n 100 | tail -n 20` will first get the first 100 lines from the text, and then it will pipe that into the next command which just grabs the last 20 digits, so the range is numbers `81 - 100`

<h2>cut</h2>

###

- cut selects fields based on a separator, which be default is a tab (Tab is 4 spaces)
- cut can also remove based on characters
- `-f<listofCols>` prints out only specified fields
- `-c<listofPos>` prints only specified characters
- `-d<c>` use the specified character as a delimiter
- for options `-f` and `-c` you can specify a list range (1-5) or seperate with commas (2,4,7)
- cut cannot refer to the "last column" nor can it reorder columns, we need to use other commands to do this such as `sed`

<h2>sort</h2>

###

- Copies input to output into a certain order
- Default is to sort based on the first characters in the line
- Can search other fields / columns rather than the first
- Can distinguish numbers
- Can ignore punctuation or case differences
- Can behave like a filter or modify inplace
- `-r` sort in descending order rather than ascending
- `-n` sort numerically rather than lexicographically
- `-d` dictionary order - ignore non-letters & non-digits
- `-t<c>` use character `<c>` to separate columns
- `-k<n>` sort on column `<n>` which you can specify

<h2>uniq</h2>

###

- uniq removes all but one copy of adjacent identical lines
- `-c` prints the number of times each line is duplicated
- `-d` only prints one copy of duplicated lines
- `-u` only prints unique lines (lines that occur only once)
- theres a trick where you can sort all the lines, and then do uniq to remove all duplicate lines

<h2>sed</h2>

###

- first reads each line of input
- checks if it matches any patterns or line-ranges
- apply editing commands to the matched lines and sends the lines to output
- Two options are:
  - `-n` do not print lines by default - applies all editing commands as normal but displays no output, unless `p` appended to edit command
  - `-E` allows for extended regular expressions
- Editing commands are:
  - `p` prints the current line
  - `d` delete the current line
  - `s/regex/replace/` substitute first occurrence of string matching `regex` by `replace` string
  - `s/regex/replace/g` substitute all occurrences of string matching `regex` by `replace` string
  - `q` terminate execution of sed
- Different commands to select line ranges:
  - `line_number` selects the specified line
  - `start_line_number, end_line_number` selects all lines between specified line numbers
  - `/regex/` selects all lines that match the regex
  - `/regex1/,/regex2/` selects all lines between matching regex1 & regex2

<h1>Tutorial Questions </h1>

<h2>Q1</h2>

###

- We need to change the file layout to easily sort the entries based on last name
- A first possible way is to make the first column of data be the lastname so we can easily sort on the first column
- Another possible way is to make sure the first field is one string, instead of using a space to separate the initials we could use `.` so initials in the example such as `J A` become `J.A`

<h2>Q2</h2>

###

<details>
<summary>Provide a command that would produce each of the following results</summary>

###

<details>
<summary>a) Display the first three lines of the file</summary>

###

- Remember that head gives us the `-n` first lines in a file
- Hence we just need to replace it with our desired number

```
head -3 /etc/passwd
```

</details>

<details>
<summary>b) Display lines belonging to the class account (starts with 'cs','se','bi' or 'en' followed by four digits</summary>

###

- We want the line to start with either cs/se/bi/en so we can use a bracket expression
- We then want it to have any four digits after which we can express with the curly brackets

```
grep -E '^(cs|se|bi|en)[0-9]{4}:' /etc/passwd
```

</details>

<details>
<summary>c) Display the username of everyone whose shell is '/bin/bash'</summary>

###

- First we want to find all the lines that end in `/bin/bash`
- We then want to grab the first column of data from those lines as that is the username
- Note that the data fields are separated by `:` character so we can use that as our delimiter and to distinguish the different fields

```
grep -E ':/bin/bash$' /etc/passwd | cut -d':' -f1
```

</details>

<details>
<summary>d) Create a tab-separated file called passwords.txt containing only usernames and passwords</summary>

###

- We want to grab the username and password, which in this case is the first two fields
- We then want to make it so that they are separated by a `tab` instead of `:`
- Hence we can use `tr` to change all the `:` to `tab` characters
- We can then redirect the output into a text file

```
cut -d':' -f1,2 /etc/passwd | tr ':' '\t' > passwords.txt
```

</details>

</details>

<h2>Q3</h2>

###

<details>
<summary>What does this command `tr -cs 'a-zA-Z0-9' '\n' < someFile` do?</summary>

###

- `-c` means complament meaning it replaces everything not in `string 1` with `string 2`. This means for this it replaces all characters that are not alphanumeric with a `newline` character
- `-s` means squeeze, which replaces any duplicate characters with just one. This is applied for example if we see multiple `newline` characters in a row to just be one instance
- `a-Za-Z0-9` means all letters and numbers can be denoted as `[:alpha:]`
- `< someFile` means the command `tr` will be be processing it on the contents of `someFile`

</details>

<h2>Q4</h2>

###

<details>
<summary>
What is the output of each of the following pipelines if the text:

```
this is big Big BIG
but this is not so big
```

</summary>

###

  <details>
  <summary>a) tr -d ' ' | wc -w</summary>
  
  - The first part of the command will delete all the spaces between words, resulting it to being a single word
  ```
  thisisbigBigBIG
  butthisisnotsobig
  ```
  - The second part of the command will print the number of words from the input, which will just be 2

  </details>

  <details>
  <summary>b) tr -cs '[:alpha:]' '\n' | wc -l</summary>
  - The first part means that if the character is not alphanumeric, replace it with a newline, so we get a list of words sepearted by a newline
  - The second part counts how many lines there are, and since there are 11 words each with their own new line `wc -l` evaulates to 11
  </details>

  <details>
  <summary>c) tr -cs '[:alpha:]' '\n' | tr '[:lower:]' '[:upper:]' | sort | uniq -c</summary>
  - The first part is the same as part (b)
  - We than translate all lower case characters to upper case characters
  - We then sort them
  - Finally we run `uniq -c` which counts all unique occurrences of a word
  - Note we sort first to bunch them all up as `uniq` works on adjacent lines

```
Output
4 BIG
1 BUT
2 IS
1 NOT
1 SO
2 THIS
```

  </details>

</details>

<h2>Q5</h2>

###

<details>
<summary>
Consider you had two files with zIDs and marks for COMP1511 and COMP2041
</summary>

###

  <details>
  <summary>Can the files be used with a 'join' command, if not what needs to be changed?</summary>
  
  - We need the data to be sorted by a common key. For this case it would be zID
  - We can see that the columns do not match with the zIDs so if we were to join it would error

  </details>

  <details>
  <summary>Write a 'join' command that prints the marks in COMP1511 & COMP2041 of everyone who did both courses</summary>
  
  - Assuming the file is sorted, we can simply join the files
  - `join` by default only includes lines in both files, there is an option to force unmatched lines to be in the result
  - We do not have to specify any keys of what to join on, as it is the first field for both files
  - We specify the delimiter so the filter can distinguish between the fields which in this case is `|`

```
join -t'|' comp1511-marks-sorted.psv comp2041-marks-sorted.psv
```

  </details>

   <details>
  <summary>Write a shell pipeline that prints marks for COMP1511 & COMP2041 sorted by COMP1511 mark ascending then by COMP2041 mark descending</summary>
  
  - We join on the common key being the zID
  - We then sort on the delimiter `|` by the second column first as that is COMP1511 mark
  - We then sort on the COMP2041 mark but in reverse to be descending
  - Note we do `-k2,2` instead of `-k2` as it could mean that it sorts more than expected which can cause unintended behaviour

```
join -t'|' comp1511-marks-sorted.psv comp2041-marks-sorted.psv | sort -t'|' -k2,2 -k3,3r
```

  </details>
</details>
