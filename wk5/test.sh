#!/bin/dash

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

trap 'rm "$expected_stdout" "$expected_stderr" "$actual_stdout" "$actual_stderr" -r "$test_dir"' INT HUP QUIT TERM EXIT

cd "$ref_dir" || exit 1 
hw.sh 1> $expected_stdout 2> $expected_stderr

cd "$test_dir" || exit 1
bw.sh 1> $actual_stdout 2> $actual_stderr

if ! diff $actual_stdout $expected_stdout
then
    echo "Error occurred"
    exit 1
fi

if ! diff $actual_stdout $expected_stdout
then
    echo "Error occurred"
    exit 1
fi