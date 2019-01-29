# property.py

# 用函数调用方式实现特性属性
class Student:
    def __init__(self, s):
        self.__score = s
    
    def getscore(self):
        '''getter'''
        return self.__score

    def setscore(self, s):
        '''setter'''
        assert 0 <= s <= 100, '成绩校验失败!'
        self.__score = s

    score = property(getscore, setscore)

stu = Student(59)
print(stu.score)  # 取值 stu.getscore()
stu.score = 99  # 赋值 stu.setscore(999)
print(stu.score)  # 999



