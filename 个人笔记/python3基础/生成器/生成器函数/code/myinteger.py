# myinteger.py

# 此示例示意用生成器函数生成一系列的整数

def myinteger(n):
    i = 0
    while i < n:
        yield i
        i += 1

for x in myinteger(10):
    print(x)

print("================")
it = iter(myinteger(20))
print(next(it))  # 0
print(next(it))  # 1

L = [x for x in myinteger(20) if x % 2 == 1]
print(L)


