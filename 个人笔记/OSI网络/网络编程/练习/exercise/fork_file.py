import os
file_name = input('请输入文件名>>>')
s = os.path.getsize(file_name)
l1 =s//2


#父进程
def parent(l,files):
    file_r = open(files,'rb')
    fw = open('code_par.txt','wb')
    while True:
        if l < 1024:
            f = file_r.read(l)
            fw.write(f)
            break
        f = file_r.read(1024)
        fw.write(f)
        l -= 1024
    fw.close()
    file_r.close()

#子进程
def child(s,l,files):
    f =open(files,'rb')
    fw = open('child_files.txt','wb')
    f.seek(l,0)
    while True:
        data = f.read(1024)
        if not data:
            break
    # f = file_r.read(s)
    # f = f[l:]
        fw.write(data)
    fw.close()
    f.close()


pid = os.fork()
if pid < 0:
    print('进程创建失败')
elif pid == 0:
    parent(l1,file_name)
else:
    child(s,l1,file_name)


