

# 第一步: 导入pymysql模块
import pymysql

# 第二步: 建立到数据库服务器的链接
from db_conf import *
conn = pymysql.connect(host,user,\
        password,dbname)

# 第三步: 创建游标对象(cursor),通过调用数据库链接
# 对象获得游标
cursor = conn.cursor()

# 第四步: 利用cursor对象，执行SQL语句
sql = 'select * from acct'
cursor.execute(sql)
# 第五步: 提交事物（如果需要）
#取出查询结果并打印
# result = cursor.fetchone()#取一笔数据
# print(result)
# result = cursor.fetchmany(2)#取二笔数据
# print(result)
result = cursor.fetchall()  #result是元组
for r in result:
    # print(r)
    acct_no = r[0]
    acct_name = r[1]
    if r[6]:
        balance = float(r[6])
    else:
        balance = 0.00
    print('账号:%s,户名:%s,余额:%.2f'% \
    (acct_no,acct_name,balance))

# 第六步: 关闭游标对象
cursor.close()

# 第七步: 关闭数据库链接对象
conn.close()