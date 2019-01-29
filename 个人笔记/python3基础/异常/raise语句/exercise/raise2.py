# raise2.py

# 此示例示意 用 raise 语句的来传递错误信息

def f1():
    n = int(input("请输入整数:"))  # 此处可能触ValueErorr错误


def f2():
    try:
        f1()
    except ValueError as err:
        print("f1函数内出错")
        print('f2里的err=', err)
        # raise err
        raise

try:
    f2()
except ValueError as err:
    print("f2内发生了ValueError类型的错误")
    print("err=", err)

