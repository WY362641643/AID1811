# with2.py

# 此示例示意用with语句改写with.py中try-finally的用法
try:
    # fr = open("test.txt", 'r')
    with open('test.txt', 'r') as fr:
        for line in fr:
            print(line)
            3 / 0
    # fr.read()  # 出错,fr已经被with语句自动关闭
except OSError:
    print('文件打开失败!')



