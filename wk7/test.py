# x = 1
try:
  print(x)
except NameError:
  print("Variable x is not defined")
except:
  print("Something else went wrong")


# f = open("a.txt", "r")
# data = f.read()
# print(data)
# f.close()

# f = open("b.txt", "w+")
# f.write("Orange")
# f.seek(0)
# data = f.read()
# print(data)
# f.close()

# a = 1
# b = 1

# w1 = "1"
# w2 = str(1)

# if w1 is w2:
#     print("w1 and w2 are equal")

# if a is b:
#     print("a and b are equal")

# if w1 == w2:
#     print("w1 and w2 are equal?")

# print(id(a), id(b))
# print(id(w1), id(w2))

# for v in range(1, 10, 2):
#     print(v)