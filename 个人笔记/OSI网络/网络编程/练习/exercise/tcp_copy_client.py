#客户端
from socket import *

#创建需要粘贴的的文件名函数
def Mypaste(s):
    paste = input('请输入需要粘贴的文件名>>')
    s.send(paste.encode())
    data = s.recv(1024)   #接收服务端反馈
    print(data.decode())
    return

#创建需要被拷贝的文件函数
def Mycopy(s):
    while True:
        copys = input('请输入源文件名>>')
        if not copys:
            break
        try:
            fr = open(copys,'rb')
            while True:
                b = fr.read(1024)
                if not b:
                    print('目标不存在')
                    break
                s.send(b)  #将文件传送给服务端
                data = s.recv(1024)   #接收服务端反馈的拷贝信息
                data = data.decode()
                print(data)
            # fr.close()  #关闭文件
                # return b
        except OSError as data:
            pass
        finally:
            fr.close()
            return data
        
#在主函数中创建套接字
def mian():
    s = socket()

    #发起链接请求
    addr=(('127.0.0.1',8867))
    s.connect(addr)
    Mypaste(s)
    data = Mycopy(s)
    print(data)
#         if not coys:
#             print('目标文件不存在')
#             continue
#         datas = data.decode()
# s =socket()

# server_addr = ('127.0.0.1',8857)
# s.connect(server_addr)
#     if datas < '0':
#         print('文件保存失败，请重新输入')
#         continue
#     print('文件保存成功')
#     break

mian()

s.close()
