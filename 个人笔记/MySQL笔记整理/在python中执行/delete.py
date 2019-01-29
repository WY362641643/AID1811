
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
    sql='''delete from acct 
            where acct_no="622345000010"
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