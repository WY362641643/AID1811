# with3.py

# 此示例示意自定义一个环境管理器,让其能用于 with语句管理

class A:
    def __enter__(self):
        print("A.__enter__方法被调用!!!")
        self.file = open('test.txt')
        return self  # return返回的对象会被 as 变量所绑定

    def __exit__(self, e_type, e_value, e_cb):
        self.file.close()
        if e_type is None:
            print("正常离开with语句")
        else:
            print("在离开with语句时发生了异常:")
            print("异常类型是:", e_type)
            print('错误对象是:', e_value)
            print("追踪对象是:", e_cb)
        print("A.__exit__被调用,已离开with语句")


with A() as a:
    print(a.file.readline())
    # 3 / 0  # 发生异常 
    print("这是with语句内部的语句")

print("程序正常退出!!!")




