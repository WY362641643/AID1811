from multiprocessing import Pool
from time import sleep,ctime

def worker(msg):
    sleep(2)
    print(msg)
    return ctime()

#创建进程池
pool = Pool()

result = []
#向进程池添加事件
for i in range(10):
    msg = 'hello %d'%i
    # 异步执行，多个一同执行
    r = pool.apply_async(func=worker,args=(msg,))
    result.append(r)

    #同步执行，一个一个执行
    # r = pool.apply(func=worker,args=(msg,))

#关闭进程池
pool.close()
#等待进程池中进程处理玩
#回收进程
pool.join()

for i in result:
    print(i.get())  # 通过get获取进程事件函数的返回值