

子查询
  1）什么是子查询：查询语句中包含另外一个查询
     也叫嵌套查询
     例如：查询发生过交易的账户信息
        select *  from acct where in 
        (select distinct acct_no from acct_trans_detail);
    -- distinct (去重复)
      说明：括号中的部分称之为子查询
            先执行子查询，返回一个结果集
            再执行外层查询
            子查询返回的结果，要和外层查询的条件匹配
            子查询只执行一次

  2）什么情况下使用子查询
     - 一个查询语句无法实现
     - 一个查询语句实现不方便、不直观

  3）单表子查询
     - 示例：查询所有余额大于平均余额的账户
     select * from acct 
     where balance > (select avg(balance) from acct)
     
     等价于：
     select * from acct
     where balance > 5214.285714;

  4）多表子查询
    - 示例1：查询所有发生过交易的账户信息
    select * from acct where acct_no in (
      select distinct acct_no from acct_trans_detail
    );
    
    - 示例2：查询所有未发生过交易的账户信息
    select * from acct where acct_no not in (
      select distinct acct_no from acct_trans_detail
    )

    - 示例3：查询所有发生过大金额交易的账户信息
             先通过子查询查询出发生10万以上交易
	     的账户，再通过外层查询查账户信息
    select * from acct where acct_no in (
      select distinct acct_no 
        from acct_trans_detail
       where amt > 100000
    )
