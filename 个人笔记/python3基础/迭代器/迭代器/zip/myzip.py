# myzip.py

# 此示例示意实现一个含有两个形参的zip函数的实现方法 

def myzip(iterable1, iterable2):
    it1 = iter(iterable1)  # 得到iterable1的迭代器 
    it2 = iter(iterable2)  # ...
    while True:
        try:
            x1 = next(it1)
            x2 = next(it2)
            yield (x1, x2)
        except StopIteration:
            return


numbers = [10086, 10000, 10010, 95588]
names = ['中国移动', '中国电信', '中国联通']
for t in myzip(numbers, names):
    print(t)