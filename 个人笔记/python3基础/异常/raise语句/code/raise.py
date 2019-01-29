# raise.py

def make_except():
    print("开始 ....")
    # raise ValueError  # 触发ValueError类型的异常
    # raise ZeroDivisionError  # raise 类型
    # 创建一个错误对象用error来绑定
    error = ValueError("XXX大街YYY号着火了!")
    raise error  # 触发ValueError类型的错误对象
    print("结束!!!")

try:
    make_except()
    print("make_except 调用完成")
except ValueError as err:
    print("收到 ValueError类型的错误通知")
    print("err=", err)  # err用来绑定raise 发出的错误对象
except ZeroDivisionError:
    print("被零除!!!")

print("程序正常结束")