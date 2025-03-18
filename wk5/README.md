<h1 align="center">Week 5</h1>

<h1>Tutorial Questions</h1>

<!-- Start of Q  -->
<h2>Q4</h2>
<details> 
<!-- ==========  -->
<summary>Apart from the take-* scripts what else do you need to submit (and give an example)?</summary>

###

```sh
#! /usr/bin/env dash

# ==============================================================================
# test0.sh
# Test the take-submit command.
#
# Written by: Dylan Brotherston <d.brotherston@unsw.edu.au>
# Date: 2025-03-10
# For COMP2041/9044 Assignment 1
# ==============================================================================

# add the current directory to the PATH so scripts
# can still be executed from it after we cd

PATH="$PATH:$(pwd)"

# Create a temporary directory for the test.
test_dir="$(mktemp -d)"
cd "$test_dir" || exit 1
ref_dir="$(mktemp -d)"
cd "$ref_dir" || exit 1

# Create some files to hold output.

expected_stdout="$(mktemp)"
expected_stderr="$(mktemp)"
actual_stdout="$(mktemp)"
actual_stderr="$(mktemp)"

# Remove the temporary directory when the test is done.

trap 'rm "$expected_stdout" "$expected_stderr" "$actual_stdout" "$actual_stderr" -r "$test_dir"' INT HUP QUIT TERM EXIT

# Retrieve the provided test files.

2041 fetch take

# Create take assessment

cd "$ref_dir" || exit 1
2041 take-add lab03_scraping_courses scraping_courses.sh scraping_courses.tests scraping_courses.marking > "$actual_stderr" 2> "$actual_stderr"
ref_exit_code=$?

cd "$test_dir" || exit 1
take-add lab03_scraping_courses scraping_courses.sh scraping_courses.tests scraping_courses.marking > "$actual_stderr" 2> "$actual_stderr"
exit_code=$?

if ! diff "$expected_stdout" "$actual_stdout" >/dev/null 2>&1; then
    echo "Failed test - stdout differs"
    diff "$expected_stdout" "$actual_stdout"
    exit 1
fi

if ! diff "$expected_stderr" "$actual_stderr" >/dev/null 2>&1; then
    echo "Failed test - stderr differs"
    diff "$expected_stderr" "$actual_stderr"
    exit 1
fi

if [ "$exit_code" -ne "$ref_exit_code" ]; then
    echo "Failed test - exit code differs"
    echo "Expected: $ref_exit_code"
    echo "Got: $exit_code"
    exit 1
fi

# make a submission for the take assessment

cd "$ref_dir" || exit 1
2041 take-submit lab03_scraping_courses z5123456 scraping_courses.sh > "$actual_stderr" 2> "$actual_stderr"
ref_exit_code=$?

cd "$test_dir" || exit 1
take-submit lab03_scraping_courses z5123456 scraping_courses.sh > "$actual_stderr" 2> "$actual_stderr"
exit_code=$?

if ! diff "$expected_stdout" "$actual_stdout" >/dev/null 2>&1; then
    echo "Failed test - stdout differs"
    diff "$expected_stdout" "$actual_stdout"
    exit 1
fi

if ! diff "$expected_stderr" "$actual_stderr" >/dev/null 2>&1; then
    echo "Failed test - stderr differs"
    diff "$expected_stderr" "$actual_stderr"
    exit 1
fi

if [ "$exit_code" -ne "$ref_exit_code" ]; then
    echo "Failed test - exit code differs"
    echo "Expected: $ref_exit_code"
    echo "Got: $exit_code"
    exit 1
fi

# make submission as a different student

cd "$ref_dir" || exit 1
2041 take-submit lab03_scraping_courses z7654321 scraping_courses.sh > "$actual_stderr" 2> "$actual_stderr"
ref_exit_code=$?

cd "$test_dir" || exit 1
take-submit lab03_scraping_courses z7654321 scraping_courses.sh > "$actual_stderr" 2> "$actual_stderr"
exit_code=$?

if ! diff "$expected_stdout" "$actual_stdout" >/dev/null 2>&1; then
    echo "Failed test - stdout differs"
    diff "$expected_stdout" "$actual_stdout"
    exit 1
fi

if ! diff "$expected_stderr" "$actual_stderr" >/dev/null 2>&1; then
    echo "Failed test - stderr differs"
    diff "$expected_stderr" "$actual_stderr"
    exit 1
fi

if [ "$exit_code" -ne "$ref_exit_code" ]; then
    echo "Failed test - exit code differs"
    echo "Expected: $ref_exit_code"
    echo "Got: $exit_code"
    exit 1
fi

# make a second submission as the first student

cd "$ref_dir" || exit 1
2041 take-submit lab03_scraping_courses z5123456 scraping_courses.sh > "$actual_stderr" 2> "$actual_stderr"
ref_exit_code=$?

cd "$test_dir" || exit 1
take-submit lab03_scraping_courses z5123456 scraping_courses.sh > "$actual_stderr" 2> "$actual_stderr"
exit_code=$?

if ! diff "$expected_stdout" "$actual_stdout" >/dev/null 2>&1; then
    echo "Failed test - stdout differs"
    diff "$expected_stdout" "$actual_stdout"
    exit 1
fi

if ! diff "$expected_stderr" "$actual_stderr" >/dev/null 2>&1; then
    echo "Failed test - stderr differs"
    diff "$expected_stderr" "$actual_stderr"
    exit 1
fi

if [ "$exit_code" -ne "$ref_exit_code" ]; then
    echo "Failed test - exit code differs"
    echo "Expected: $ref_exit_code"
    echo "Got: $exit_code"
    exit 1
fi

# check summary of submissions

cd "$ref_dir" || exit 1
2041 take-summary > "$actual_stdout" 2> "$actual_stderr"
ref_exit_code=$?

cd "$test_dir" || exit 1
take-summary > "$actual_stdout" 2> "$actual_stderr"
exit_code=$?

if ! diff "$expected_stdout" "$actual_stdout" >/dev/null 2>&1; then
    echo "Failed test - stdout differs"
    diff "$expected_stdout" "$actual_stdout"
    exit 1
fi

if ! diff "$expected_stderr" "$actual_stderr" >/dev/null 2>&1; then
    echo "Failed test - stderr differs"
    diff "$expected_stderr" "$actual_stderr"
    exit 1
fi

if [ "$exit_code" -ne "$ref_exit_code" ]; then
    echo "Failed test - exit code differs"
    echo "Expected: $ref_exit_code"
    echo "Got: $exit_code"
    exit 1
fi

# feth first students first submission

cd "$ref_dir" || exit 1
2041 take-fetch lab03_scraping_courses z5123456 1 > "$actual_stderr" 2> "$actual_stderr"
ref_exit_code=$?

cd "$test_dir" || exit 1
take-fetch lab03_scraping_courses z5123456 1 > "$actual_stderr" 2> "$actual_stderr"
exit_code=$?

if ! diff "$expected_stdout" "$actual_stdout" >/dev/null 2>&1; then
    echo "Failed test - stdout differs"
    diff "$expected_stdout" "$actual_stdout"
    exit 1
fi

if ! diff "$expected_stderr" "$actual_stderr" >/dev/null 2>&1; then
    echo "Failed test - stderr differs"
    diff "$expected_stderr" "$actual_stderr"
    exit 1
fi

if [ "$exit_code" -ne "$ref_exit_code" ]; then
    echo "Failed test - exit code differs"
    echo "Expected: $ref_exit_code"
    echo "Got: $exit_code"
    exit 1
fi

# All tests passed.
echo "All tests passed."
```

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q6</h2>
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
<h2>Q8</h2>
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
<h2>Q9</h2>
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
