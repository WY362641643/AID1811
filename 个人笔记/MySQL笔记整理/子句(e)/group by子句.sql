
group by 子句
    - 作用:对查询结果进行分组,通常和聚合函数配合使用
    - 格式：group by 分组字段名称
    - 示例：
      e.g.  统计各种状态账户数据量
      select acct_type "账户类型", count(*) "数量" 
        from acct
       group by acct_type;

      e.g. 统计各类账户余额的最大值
      select acct_type "账户类型",max(balance) "最大余额"
        from acct
	group by acct_type;



- SQL语句的执行顺序(难点)
      第一步：from acct
              首先执行from，找到源数据

      第二步：where 条件过滤
              选出所有满足条件的数据

      第三步：group by子句
              进行分组

      第四步：sum(balance), acct_type
              按照分组，对每组进行统计

      第五步：having acct_type is not null
              把聚合以后不满足条件的数据过滤掉

      第六步：order by acct_type desc
              按照统计结果排序

      第七步：limit 1
              限定显示笔数
