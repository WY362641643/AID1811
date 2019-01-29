

运算符操作
    1）比较操作符：>,<,>=,<=,<>或!=
        e.g. 查询账户余额小于5000的账户
            select * from acct where balance < 5000;

        e.g. 查询账户状态不等于2的账户
            select * from acct where status <> 2;

    2）逻辑运算符：and, or
        - and: 多个条件同时满足
        - or：满足多个条件其中的一个

        e.g. 查询余额大于0且状态为2的账户
            select * from acct
            where balance > 0
            and status = 2;

        e.g. 查询状态为1或状态为2的账户信息
            select * from acct
            where status = 1
                or status = 2;

        e.g. 多个条件组合
            select * from acct
            where (acct_no = '622345000001' or
                    acct_no = '622345000002')
            and status = 1;

    3）范围比较
        - in: 在某个范围（集合）中
        - not in: 不在某个范围（集中）中
        - between...and...: 在...与...之间

        e.g. 使用IN查询账号在某个指定范围内的账户信息
            select * from acct
            where acct_no in('622345000001','622345000002');

        e.g. 使用between查询余额在某个范围之内的账户信息
            （包含两个边界值）
            select * from acct
            where balance between 3000 and 5000;

    4)模糊查询：　like
        - 格式： where 字段名称　like '通配字符串'

        - 通配符 _ 匹配单个字符
        - 通配符 % 匹配任意个字符
        - 查询速度较慢，大量使用会造成程序性能下降

    5)空／非空判断( null 是一个特殊值，不能用等号判断)
        －判断空：is null 
        －判断非空：is not null 

