# property.py

# 用装饰器方式实现特性属性
class Student:
    def __init__(self, s):
        self.__score = s
    
    @property
    def score(self):
        '''getter'''
        return self.__score

    @score.setter
    def score(self, s):
        '''setter'''
        assert 0 <= s <= 100, '成绩校验失败!'
        self.__score = s

stu = Student(59)
print(stu.score)  # 取值 stu.getscore()
stu.score = 999  # 赋值 stu.setscore(999)
print(stu.score)  # 999



