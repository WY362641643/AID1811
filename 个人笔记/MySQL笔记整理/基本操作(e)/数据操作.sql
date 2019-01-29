
数据操作（更新．删除）［重点］


首先，重新创建acct表
        create table acct(
        acct_no varchar(32),-- 账号,字符串,32字节
        acct_name varchar(128),-- 户名,128字节
        cust_no varchar(32), -- 客户编号
        acct_type int, -- 账户类型,整数型
        reg_date  date, -- 开户日期, 日期类型
        status int,    -- 账户状态,整数型
        balance decimal(16,2) -- 数字类型
                    -- 最长16位,2位小数
        ) default charset=utf8;

        * 需要注意地方：
        语句中，除了注释部分以外，不能出现中文字符
        括号必须匹配，并且嵌套正确，最好成对书写
        date日期类型，容易写成data
        注意其它的拼写错误
        最后的分号不要忘记
        注释两个横线后面必须加空格


插入数据： insert into
    示例1： 向acct表插入一笔数据

        insert into acct 
        values('622345000001', 'Jerry', 'C0001',
            1, now(), 1, 1000.00);

        * 需要注意的地方
            除字符串内容以外，不能有中文符号
        字段的个数、类型、顺序必须和表结构一致
        字符串类型的数据使用单引号引起来
        now()是一个系统函数，取数据库系统当前日期
        每个值之间使用英文逗号分隔

    示例2：使用一个SQL语句插入多笔数据
        insert into acct values
        ('622345000002','Tom','C0002',1,now(),1,2000.00),
        ('622345000003','Dekie','C0003',1,now(),1,3000.00),
        ('622345000004','Dokas','C0004',1,now(),1,4000.00);

    示例3：指定字段插入
        insert into acct(acct_no, acct_name)
        values('622345000005', 'Emma');


查询数据
    - 格式：
    select * from 表名 [where 条件]
    select 字段列表 from 表名 [where 条件]

    - 示例1：查询所有数据
    select * from acct;
    
    - 示例2：指定查询部分字段
    select acct_no, acct_name, balance from acct;

    - 示例3：查询指定字段，为字段指定别名
    select acct_no "账号",-- 双引号中间为别名
        acct_name "户名", 
        balance "余额"
　　　from acct;

    - 示例4：查询时，使用字段的值进行计算
            查询账号余额，以万元为单位显示
　　　　select acct_no "账号",-- 双引号中间为别名
        acct_name "户名", 
        balance / 10000 "余额(万元)"
　　　　from acct;

    - 示例5：带条件的查询
        -- 带两个条件的查询, 两个条件同时满足
        select * from acct
        where acct_no = '622345000001'
        and acct_name = 'Jerry';

        -- 带两个条件的查询, 两个条件满足一个
        select acct_no, acct_name, balance
        from acct 
        where acct_name = 'Jerry'
        or acct_name = 'Tom';



更改数据库默认字符集
    1. 方法 ：修改数据库的配置文件
    2. 步骤 ：
        1. 获取root权限
                sudo -i
        2. cd /etc/mysql/mysql.conf.d/
        3. 文件备份(必须执行)
                cp mysqld.cnf mysqld.cnf.bak
        4. 修改配置文件
                subl mysqld.cnf
                找 ：
                    [mysqld]
                添加
                    character_set_server = utf8
        5. 保存文件，重启服务
                sudo /etc/init.d/mysql restart
        Mac ：
            /etc/my.cnf
8. 客户端的连接与断开
    连接 ： mysql -h主机名 -u用户名 -p密码
            只有连接成功，才可以使用数据库服务，书写
            SQL语句
    断开 ：
        exit; | quit; | \q;
        断开与客户端的链接，并不会结束服务
        结束服务使用 ：
            sudo /etc/init.d/mysql stop




数据更新
    - 语法格式
        update 表名称
            set 字段１　=　值１,
                字段２　=　值２,
                ......
        where 条件表达式;
    - 示例：
    e.g. 将账户622345000001状态修改为2
        update acct
            set status = 2
        where acct_no = '622345000001';

    e.g. 将账户622345000001余额增加10000
        update acct
            set balance = balance + 100000
        where acct_no = '622345000001';
    
    - 注意事项：
        修改的值要和字段的值、长度相匹配
        修改时要使用条件限定，如果不限定则修改所有
        如果没有满足条件的数据，则修改笔数为0
        - 练习：编写注销账号的SQL语句（修改状态、余额为0）
        update acct
	    set status = 4,
	       balance = 0
	    where acct_no='622345000003';


删除记录
    - 语法格式：
        delete from 表名称 where 条件表达式;
    
    - 示例：删除账号为622345000003的账户信息
        delete from acct where acct_no='622345000003';

    * 特别注意：删除数据时一定要带条件