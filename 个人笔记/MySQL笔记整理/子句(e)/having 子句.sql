
having 子句
    - 作用：对分组聚合的结果进行过滤
            需要和group by 子句配合使用
    - 格式：gourp by 分组字段 having 过滤条件
    - 示例：统计各类账户余额总和，不显示账户类型为
            null的数据
      select acct_type "类型", sum(balance) "总余额"
        from acct     -- 运行from,找到源文件
	-- where acct_type in(1,2,3,4)    --选出所有满足的条间
       group by acct_type     --进行分组
       having acct_type is not null --把聚合以后不满足条件的数据过滤掉
       order by acct_type desc  --按照统计结果排序
       limit 2;       --限定显示笔数
       -- having sum(balance) > 5000;

    - 补充说明：
      having子句只能对group by子句的结果过滤
      where只能限定表中实际存在的字段,位于from后
