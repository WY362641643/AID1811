# iterator.py

# 此示例示意用迭代器遍历一个列表
L = [2, 3, 5, 7]
# 1. 先让L提供一个迭代器
it = iter(L)
# 循环从迭代器中获取数据,直到接收到StopIteration异常为止
while True:
    try:
        x = next(it)
        print(x)
    except StopIteration:
        break

# ------- 以上多条语句 可以用如下的for循环来实现
for x in L:
    print(x)

