names = ['中国移动', '中国电信', '中国联通']
for t in enumerate(names):
    print(t)  # (0, '中国移动')  (1, '中国电信')

for t in enumerate(names, 101):
    print(t)  # (101, '中国移动'), (102, ....)

for index, name in enumerate(names):
    if name == '中国联通':
        del names[index]  # 根据索引删除元素
        break