#!/usr/bin/env python3
import sys

def main():
    if len(sys.argv) != 4:
        print(f"Usage: {sys.argv[0]} <row> <col> <column-width>")
        sys.exit(1)

    row = int(sys.argv[1])
    col = int(sys.argv[2])
    width = int(sys.argv[3])

    for x in range(1, row + 1):
        # The x: >{width} part means to right align "x" to the given "width"
        print(f"{x: >{width}}", end="")
        for y in range(2, col + 1):
            print(f" {x * y: >{width}}", end="")
        print()


if __name__ == "__main__":
    main()