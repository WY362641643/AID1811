
# 此示例示意 索引和切片运算符 [] 的重载
class MyList:
    def __init__(self, iterable=()):
        self.data = [x for x in iterable]

    def __repr__(self):
        return "MyList(%s)" % self.data

    def __getitem__(self, i):
        return self.data[i]
    
    def __setitem__(self, i, v):
        print("__setitem__方法被调用,i=", i, 'v=', v)
        self.data[i] = v

    def __delitem__(self, i):
        del self.data[i]

L1 = MyList([1, -2, 3, -4, 5])
v = L1[2]  # 等同于 v = L1.__getitem__(2)
print(v)  # 3

L1[1] = +2  # 等同于 L1.__setitem__(1, +2)
print(L1)

del L1[3]  # 等同于 L1.__delitem__(3)
print(L1)   # ???


