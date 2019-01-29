
order by 子句
    - 作用：对查询结果按照某个字段值进行排序
    - 格式：order by 排序字段 [ASC/DESC]
            ASC表示升序
	        DESC表示降序
	        不写排序依据，默认为升序

    - 示例：
      e.g. 查询账户信息，按照账户余额升序排列
      select * from acct order by balance asc;-- desc

      e.g. 查询账户信息，按照账户类型升序、金额降序
      select * from acct
        order by acct_type asc, balance desc;
