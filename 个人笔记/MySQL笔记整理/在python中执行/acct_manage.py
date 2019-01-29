#acct_manage.py
#账户管理系统，实现账户增删改查
import pymysql
from db_conf import *

db_conn = None   #链接对象

def conn_database():    #链接数据库的函数
    global db_conn
    db_conn = pymysql.connect(host,user,\
        password,dbname)
    if not db_conn:   #判断对象是否为空
        print('链接数据库失败')
        return -1
    else:
        return 0

def close_database():
    global db_conn
    if db_conn:   #判断对象是否为空
        db_conn.close()

def print_menu():
    menu='''
    -------------账户管理系统--------------
        １－查询账户信息
        ２－新建账户
        ３－修改账户
        ４－删除账户
        ５－退出
    ''' 
    print(menu)
    return

#查询账户,如果用户输入账户，则以账号为条件查询，
# 如果不输入则查询所有账户
def query_acct():
    acct_no = input('请输入要查询的账号')
    if acct_no and acct_no !='':  #用户输入了账户
        sql = '''
            select * from acct
            where acct_no ='%s'
        '''%acct_no
    else:   #用户未输入账户
        sql = 'select * from acct'

    global db_conn
    cursor = db_conn.cursor()  #获取游标
    try:
        cursor.execute(sql)  #执行ＳＱＬ语句
        result = cursor.fetchall()  #取所有数据
        for r in result:
            acct_no = r[0]  #账号
            acct_name = r[1]  #户名
            if r[6]:
                balance = float(r[6])  #余额
            print('账号：%s,户名：%s,余额：%0.2f'%\
            (acct_no,acct_name,balance))
    except Exception as e:
        print('查询异常')
        print(e)
    return

def new_acct():  #新增账户
    try:
        acct_no = input('请输入账号：')
        acct_name = input('请输入户名：')
        acct_type = int(input('请选择账户类型：１－借记卡　　２－理财卡'))
        balance = float(input('请输入账户金额：'))
        assert acct_type in [1,2] #判断acct_type是否合法
        assert balance >= 10.00

        #拼装SQL语句，执行插入
        sql = '''
            insert into acct
            (acct_no,acct_name,acct_type,balance)
            values(%s,"%s",%s,%.2f)
        '''%(acct_no,acct_name,acct_type,balance)
        #获取游标，执行
        global db_conn
        cursor = db_conn.cursor()
        cursor.execute(sql)    #执行
        db_conn.commit()    #提交
        print('插入成功')
    except Exception as e:
        db_conn.rollback()  #回滚事务
        print('插入失败')
        print(e)
    return

def update_acct():
    def name_acct(myid):
        myname = input('请输入姓名：')
        sql = '''
        update acct
        set acct_name = '%s'
        where acct_no = %s
        '''%(myname,myid)
        return sql

    def ba_acct(myid):
        try:
            balance = float(input('请输入金额'))
            sql ='''
            update acct
            set balance = %.2f
            where acct_no = %s
            '''%(balance,myid)
            return sql
        except:
            sql = None
            print('修改失败')
            return sql

    try:
        acct_no = input('请输入修改的账号：')
        i=zhanghao(acct_no)
        if i:
            sql = '''select * from acct
            where acct_no = %s
            '''%acct_no
            global db_conn
            cursor = db_conn.cursor()  #创建游标
            cursor.execute(sql)   #执行
            relust = cursor.fetchall()  #提取
            for r in relust:
                acct_no = r[0]
                acct_name =r[1]
                if r[6]:
                    balance = float(r[6])
                else:
                    balance = 0.00
            info_acct = ''''
            账号：%s
            1.姓名：%s
            2.金额：%.2f'''%(acct_no,acct_name,balance)
            print(info_acct)
            oper = input('请选择类型编号：')
            if oper == '1':
                sql=name_acct(acct_no)
            elif oper =='2':
                sql=ba_acct(acct_no)
            else:
                print('输入错误')
                cursor.close()   #关闭游标
                print('修改失败')
                return
            cursor.execute(sql)  #执行 
            db_conn.commit()   #提交
            print('修改成功')
            cursor.close()
            db_conn.close()
            return
        else:
            print('账户不存在')
    except Exception as e:
        print('修改失败')
        print(e)
    return

def zhanghao(s):   #判断账户是否存在
    sql='''
    select * from acct
    '''
    global db_conn
    cursor = db_conn.cursor()  #创建游标
    cursor.execute(sql)   #执行
    relust = cursor.fetchall()  #提取
    for r in relust:
        if r[0] == s:
            return 1
    return 0
        
def delete_acct():   #删除
    try:
        acct_no=input('请输入账号')
        i = zhanghao(acct_no)
        if i:
            sql ='''
            delete from acct
            where acct_no =%s
            '''%acct_no
            global db_conn
            cursor = db_conn.cursor()
            cursor.execute(sql) #执行
            db_conn.commit()  #提交
            print('删除成功')
            cursor.close()
            db_conn.close()
        else:
            print('输入的账号不存在')
        return    
    except Exception as e:
        print('删除失败')
        print(e)

#main()
def main():
    #链接数据库
    if conn_database() < 0:
        return
    #循环打印菜单，根据选择的菜单调用不同函数处理
    while True:
        print_menu()
        oper = input('请选择：')
        if not oper:
            continue
        if oper == '1':    #查询
            query_acct()
        elif oper == '2':  #新建
            new_acct()
        elif oper == '3':  #修改
            update_acct()
        elif oper == '4':  #删除
            delete_acct()
        elif oper == '5':  #退出
            break   
        else:
            print('请输入正确的值')
            continue

    #关闭数据库
    close_database()

#主函数
if __name__=='__main__':
    main()