
# 此示例示意 切片运算符 [] 的重载
class MyList:
    def __init__(self, iterable=()):
        self.data = [x for x in iterable]

    def __repr__(self):
        return "MyList(%s)" % self.data

    def __getitem__(self, i):
        print('__getitem__: i=', i)
        if type(i) is int:
            print("您正在做索引操作")
        elif type(i) is slice:
            print("您正在做切片操作")
            print("起始值是:", i.start)
            print("终止值是:", i.stop)
            print("步长是:", i.step)
        elif type(i) is str:
            print("您别用字符串进行操作")
            return 0
        return self.data[i]
    
L1 = MyList([1, -2, 3, -4, 5])

a = L1[0::2]  # 
# a = L1[:]  # a = L1.__getitem__(slice(None, None, None))
print('a=', a)

L1['hello']




