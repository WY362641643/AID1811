#insert.py
#pymysql的插入示例
import pymysql
from db_conf import *

try:
    #链接数据库
    conn = pymysql.connect(host,user,\
                password,dbname)
    #获取游标
    cursor = conn.cursor()
    #执行SQL语句
    sql='''insert into
    acct(acct_no,acct_name,cust_no,acct_type,reg_date,status,balance)
    values("622345000010","Fisher","c0009",
            1,date(now()),1,3.00)
    '''
    cursor.execute(sql) #执行
    conn.commit()    #提交事物
    print('Inset OK')
except Exception as e:
    print('数据库插入异常')
    print(e)
finally:
    cursor.close()  #关闭游标
    conn.close()    #关闭连接