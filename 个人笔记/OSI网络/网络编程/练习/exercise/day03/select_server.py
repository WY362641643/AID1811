

from select import select
from socket import *
from time import sleep
import sys

#准备关注IO
s=socket()
s.setsockopt(SOL_SOCKET,SO_REUSEADDR,1)
s.bind(('0.0.0.0',8888))
s.listen(3)
print('服务端准备就绪')
#添加关注列表
n = sys.stdin

rlist = [s,n]
wlist = []
xlist = [s]
fw = open('code.txt','a')
std = ''

while True:
    #监控IO的发生
    # fw.close()
    # break
    rs,ws,xs = select(rlist,wlist,xlist)
    #遍历三个列表确定哪个IO发生
    for r in rs:
        #如果遍历到s，说明s就绪，则有客户端发起连接
        if r is s:
            c,addr = r.accept()
            print('connect from',addr)
            rlist.append(c)
        #客户端链接套接字则接收消息
        elif r is n:
            std = n.readline()   
            if std == 'exit\n':
                break
            fw.write(std)
        else:
            data = r.recv(1024)
            if not data:
                print('%s退出服务端'%r)
                rlist.remove(r)
                r.close()
                continue
            print('Receive from %s:%s'%(
                r.getpeername(),data.decode()))
            dat = str(r.getpeername()) + data.decode()
            print(dat)
            # data = (r.getpeername(),data.decode())
            fw.write(dat)

            # r.send(b'Receive')
            wlist.append(c)
            if c in wlist:
                print('准备返回值')

    for w in ws:
        w.send(b'Receive your message')
        print('已返回值')
        wlist.remove(w)
        print('已删除')
    
    for x in xs:
        x.close()
        raise

    if std == 'exit\n':
        break
        
fw.close()
s.close()
print('服务端已关闭')