f = open("a.txt", "r")
data = f.read()
print(data)
f.close()

f = open("b.txt", "w+")
f.write("Orange")
f.seek(0)
data = f.read()
print(data)
f.close()