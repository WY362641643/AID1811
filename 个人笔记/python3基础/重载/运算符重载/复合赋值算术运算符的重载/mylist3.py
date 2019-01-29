class MyList:
    def __init__(self, iterable=()):
        '''此处用给定的可迭代对象iterable创建一个新的列表,
        绑定此对象的data 实例变量中'''
        self.data = [x for x in iterable]

    def __repr__(self):
        return "MyList(%s)" % self.data

    def __add__(self, rhs):
        print("__add__")
        myl = MyList(self.data + rhs.data)  # 新建
        print("id(myl)=", id(myl))
        return myl

    def __iadd__(self, rhs):
        '''此方法用于重载  += 运算符'''
        print("__iadd__")
        self.data.extend(rhs.data)  # self.data += rhs.data
        return self

L1 = MyList([1, 2, 3])
L2 = MyList(range(4, 7))


print(id(L1))
L1 += L2  # 1) L1.__iadd__(L2)  2) L1 = L1.__add__(L2)
# L1 = L1 + L2  # L1 = MyList([1, 2, 3, 4, 5, 6])
print(id(L1))

print(L1)
