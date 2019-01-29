

子查询
     -什么是子查询：查询语句中包含另一个查询
     　　也叫嵌套查询
     e.g：
     　select * from acct where acct_no in (  -- 外层查询
        select distinct acct_no from acct_trans_detail
     )
     说明：括号中的部分称之为子查询
        　先执行查询，返回一个结果集
        再执行外层查询
        子查询返回的结果，要和外层查询的条件匹配
        子查询只执行一次
     -什么情况下使用子查询
        －一个查询语句无法实现
        －一个查询语句实现不够方便，不直观

     -单表子查询
         -e.g：
             -查询余额大于平均余额的账户
             select * from acct
             where balance > (select avg(balance) from acct);

     -多表子查询
         -查询所有发生过交易的账户信息
         select * from acct where acct_no in (
             select distinct acct_no from acct_trans_detail
         );
         -查询所有未发生过交易的账户信息
         delect * from acct where acct_no not in (
             select distinct acct_no from acct_trans_detail
         );
         -查询所有发生过大额交易的账户信息
         insert into acct_trans_detail VALUES
         ('201901002',now(),'622345000002',1,'10001.00'),
         ('201901003',now(),'622345000003',1,'10002.00');
         