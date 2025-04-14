import sys

# Open both of the files
# Add words into a list to compare later on
# Sort
# Compare the two word lists

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

# print(words1)
words1 = sorted(words1)
# print(words1)

for w in words1:
    if w not in words2:
        print(w)