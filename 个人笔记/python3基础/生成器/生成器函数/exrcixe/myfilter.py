#   2. 试写一个生成器函数 myfilter(func, iterable)
#     要求此函数与python内建的函数的功能完全相同
#     如:
#       def myfilter(func, iterable):
#           ....
        
#       for i in myfilter(lambda x: x%2==1, range(10)):
#           print(i)  # 1 3 5 7 9




# 方法1
# def myfilter(func, iterable):
#     it = iter(iterable)  # 拿到可迭代对象的迭代器
#     while True:
#         try:
#             x = next(it)
#             if func(x):
#                 yield x
#         except StopIteration:
#             return

# 方法2
def myfilter(func, iterable):
    for x in iterable:
        if func(x):
            yield x

# 方法3
def myfilter(func, iterable):
    return (x for x in iterable if func(x))


for i in myfilter(lambda x: x%2==1, range(10)):
    print(i)  # 1 3 5 7 9

