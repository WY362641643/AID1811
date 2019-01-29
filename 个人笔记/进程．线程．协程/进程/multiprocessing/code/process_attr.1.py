from multiprocessing import Process
from time import ctime,sleep

def tm():
    for i in range(4):
        sleep(1)
        print(ctime())

p = Process(target = tm,name = 'Student')

p.daemon = True

p.start()


print('Proess name',p.name)
print('Proess PID',p.pid)
print('Proess alive',p.is_alive())

# p.join()