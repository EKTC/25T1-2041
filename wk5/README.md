<h1 align="center">Week 5</h1>

<h1>Tutorial Questions</h1>

<!-- Start of Q  -->
<h2>Q1</h2>
<details> 
<!-- ==========  -->
<summary>Write a shell script extract.sh that, when given one or more archive files as command line arguments, will use the correct program to extract the files.</summary>

###

```sh
#! /usr/bin/env dash

case $# in
  0)
    echo "Usage: $0 <file> [<file> ...]"
    exit 2
    ;;
esac

status=0

for archive in "$@"; do
    if [ ! -f "$archive" ]; then
        echo "$0: error: '$archive' is not a file" >&2
        status=1
        continue
    fi

    case "$archive" in
        *.tar.bz2) tar xjf    "$archive" ;;
        *.tar.gz)  tar xzf    "$archive" ;;
        *.tar.xz)  tar xJf    "$archive" ;;
        *.bz2)     bunzip2    "$archive" ;;
        *.rar)     rar x      "$archive" ;;
        *.gz)      gunzip     "$archive" ;;
        *.tar)     tar xf     "$archive" ;;
        *.tbz2)    tar xjf    "$archive" ;;
        *.tgz)     tar xzf    "$archive" ;;
        *.zip)     unzip      "$archive" ;;
        *.jar)     unzip      "$archive" ;;
        *.Z)       uncompress "$archive" ;;
        *.7z)      7z x       "$archive" ;;
        *)
            echo "$0: error: '$archive' cannot be extracted" >&2
            status=1
        ;;
    esac
done

exit $status
```

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q3</h2>
<details> 
<!-- ==========  -->
<summary>Write a shell function top_and_bottom that, given a file name, prints the file name, plus the first and last lines of the file.</summary>

###

```sh
#! /usr/bin/env dash

top_and_bottom() {
    echo "================="
    echo "$1"
    echo "-----------------"
    sed -n '1p;$p' "$1"
    echo "================="
}

for file in "$@"; do
    top_and_bottom "$file"
done
```

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q4</h2>
<details> 
<!-- ==========  -->
<summary>
Write a shell function print_message that, given an optional exit status and a message:

If no exit status is given the program should print a warning \
If an exit status is given the program should print an error and exit the program

</summary>

###

```sh
#! /usr/bin/dash

print_message() {
    if [ $# -gt 1 ]; then
        echo "$0: error: $2"
        exit $1
    else
        echo "$0: warning: $1"
    fi
}

echo "This will print a warning"
print_message "This is a warning"

echo "This will print an error"
print_message 1 "This is an error"
```

<!-- End of Q  -->
</details> 
<!--  =======  -->
