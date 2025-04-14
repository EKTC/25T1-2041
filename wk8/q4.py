import sys

def main():
    row = int(sys.argv[1])
    col = int(sys.argv[2])
    col_width = int(sys.argv[3])

    for x in range(1, row + 1):
        print(f"{x: >{col_width}}", end="")
        for y in range(2, col + 1):
            print(f"{x * y: >{col_width}}", end="")
        print()

if __name__ == "__main__":
    main()