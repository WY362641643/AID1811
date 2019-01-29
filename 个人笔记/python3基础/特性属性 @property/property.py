# property.py

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

stu = Student(59)

print(stu.getscore())  # 取值59
stu.setscore(99)
print(stu.getscore())  # 59

# print(stu.score)  # 取值 getscore
# stu.score = 999  # 赋值 setscore
# print(stu.score)  # 999


