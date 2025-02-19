<h1 align="center">Week 2</h1>

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
