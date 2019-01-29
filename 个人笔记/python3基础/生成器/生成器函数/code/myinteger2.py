# myinteger.py

# 此示例示意用生成器函数生成一系列的整数

# 生成器对象通常是一次性的,通常不可重复使用
def myinteger(n):
    i = 0
    while i < n:
        yield i
        i += 1

gen = myinteger(3)

for x in gen:
    print(x)  # 0 1 2

for x in gen:
    print(x)  # 空

