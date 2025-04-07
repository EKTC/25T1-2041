#!/usr/bin/env python3
import sys

def main():
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <file1> <file2>")
        sys.exit(1)

    # Idea is to get the sets of the two files
    # And then get the difference for the words only in file1
    words1 = set()

    with open(sys.argv[1]) as f1:
        for word in f1:
            word = word.strip()
            words1.add(word)

    words2 = set()

    with open(sys.argv[2]) as f2:
        for word in f2:
            word = word.strip()
            words2.add(word)

    for word in words1:
        if word not in words2:
            print(word)
    
    print("<=============>")
    for word in words1 - words2:
        print(word)    

if __name__ == "__main__":
    main()
