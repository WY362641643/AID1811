# with.py

try:
    fr = open("test.txt", 'r')
    try:
        for line in fr:
            print(line)
            3 / 0
    finally:
        fr.close()
except OSError:
    print('文件打开失败!')



