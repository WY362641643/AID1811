# 练习:
#   写一个生成器函数 myeven(start, stop)  # 用来生成从
#     start 开始到stop结束区间内的一系列偶数(不包含stop)
#   如 :
#     def myeven(start, stop):
#         ....  # 此处自己实现

#     evens = list(myeven(10, 20))
#     print(evens)  # [10, 12, 14, 16, 18]
#     for x in myeven(21, 30):
#         print(x)   # 打印22, 24, 26, 28


def myeven(start, stop):
    i = start
    while i < stop:
        if i % 2 == 1:
            yield i
        i += 1
    # return [x for x in range(start, stop) if x % 2 == 1]

evens = list(myeven(10, 20))
print(evens)  # [10, 12, 14, 16, 18]
for x in myeven(21, 30):
    print(x)   # 打印22, 24, 26, 28
