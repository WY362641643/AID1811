

pymysql库: Python语言访问MySQL接口
  安装：
  在线：sudo pip3 install pymysql
  离线:
    第一步: 下载安装包，下载地址
    第二部: 解压包
      tar -zxvf PyMySQL-0.9.3.tar.gz
      cd PyMySQL-0.9.3目录
      python3 setup.py install
    
  验证: 
    进入Python交互模式，执行导入包操作
    import pymysql
    如果不报错，则说明安装成功

PyMySQL访问MySQL的流程
    第一步: 导入pymysql模块
    第二步: 建立到数据库服务器的链接
    第三步: 创建游标对象(cursor),通过调用数据库链接
           对象获得游标
    第四步: 利用cursor对象，执行SQL语句
            -- cursor.execute(sql)
    第五步: 提交事物（如果需要）
    第六步: 关闭游标对象
    第七步: 关闭数据库链接对象
        详见：query.py

    
    PyMySQL模块的主要方法
        connect: 链接数据库
            参数: host   服务器地址
                 port   服务器
                 passwd   密码
                 db       数据库名称
                 charset  指定编码名称


        链接对象支持的方法
            cursor()        获取游标
            commit()        提交事务
            rollback()      回滚事务
            close()         关闭游标

        游标对象支持的方法
            execute(sql)        执行SQL语句
            fetchall()          取得查询结果集中所有数据
            fetchone()          取查询结果集中一笔数据
            fetchmany(size)     取得指定笔数数据
            close()             关闭游标对象

            属性:
                ROWCOUNT        返回修改影响行数