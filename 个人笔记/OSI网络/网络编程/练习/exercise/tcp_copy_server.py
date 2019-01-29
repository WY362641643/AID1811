#服务端
from socket import *

def Mycopy(coys,pasts):

#创建套接字
s = socket(AF_INET,
            SOCK_STREAM)

#绑定地址
s.bind(('0.0.0.0',8867))

#设置监听
s.listen(10)
print('服务端启动成功，请稍等．．．')
connfd,addr = s.accept()

#消息收发

paste = connfd.recv(1024) #　需要粘贴的文件名称
connfd.send(b'OK paste')
while True:
    coy = connfd.recv(1024)  #　需要复制的源文件
    if not coy:
        break
    # connfd.send(b'OK copy')  #　　返回确认已收到源文件
    else
        try:
            paste = pasts.decode()
            fw = open(paste,'wb')
            fw.write(coy)
        except OSError as o:
            fw.close()
            print('fw文件关闭')
        #进入Mycopy函数，并返回判断值
# if retued < 0:
#     res= -1
# else:
#     res= 0
res= 0
connfd.send(str(res).encode())
fw.close()
connfd.close()
s.close()
print('文件关闭，服务端关闭')