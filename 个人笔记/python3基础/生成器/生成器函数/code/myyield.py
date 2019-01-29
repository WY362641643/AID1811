# myyield.py

# 此示例示意生成器函数的创建 和调用

def myyield():
    print("即将生成2")
    yield 2
    print("生成器生成结束")

gen = myyield()  # 调用生成器函数生成一个生成器
print(gen)   # <generator object myyield at 0x7f5787915780>

it = iter(gen)  # 生成器中获取一个迭代器
print(next(it))  # 向迭代器要数据,此时生成器函数才会执行一步
print(next(it))  # 触发StopIteration异常
