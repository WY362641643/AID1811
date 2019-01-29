# myyield.py

# 此示例示意生成器函数的创建 
# 和用for语句来调用生成器函数:

def myyield():
    yield 2
    yield 3
    yield 5
    yield 7
    print("生成器生成结束")

gen = myyield()  # 调用生成器函数生成一个生成器
for x in gen:
    print(x)


    