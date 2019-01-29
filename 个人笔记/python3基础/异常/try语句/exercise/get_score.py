#   写一个函数 get_score() 获取学生的成绩(0~100中的整数),
#   如果用户输入的成绩不是0~100之间的数,则返回0
#     如:
#       def get_score():
#           s = input("请输入成绩(0~100): ")
#           ...

#       score = get_score()
#       print("学生的成绩是:" score)


def get_score():
    s = input("请输入成绩(0~100): ")
    scr = int(s)
    if 0 <= scr <= 100:
        return scr
    return 0

try:
    score = get_score()
except:
    score = 0

print("学生的成绩是:", score)
