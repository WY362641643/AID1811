from multiprocessing import Pipe,Process
from time import sleep

#创建管道
fd1,fd2 = Pipe()


#子进程通过管道发消息
def fun(name):
    sleep(1)
    fd2.send(name)

jobt = []

for ch in range(10):
    msg = 'hello %d'%ch
    p = Process(target = fun,args = (msg,))
    jobt.append(p)
    p.start()

#父进程接收消息
for ch in range(8):
    data = fd1.recv()
    print(data,'namber=',ch)

#关闭进程
for ch in jobt:
    ch.join()