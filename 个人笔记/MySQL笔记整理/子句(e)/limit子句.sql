
limit子句
    - 作用：限定显示的查询结果笔数
    - 格式： limit n    只显示前面n行

            limit m,n  从m笔开始显示，总共显示n笔
	               （通常用作分页查询）

    - 示例：
      e.g. 查询账户余额最大的前3个账户
      select acct_no, acct_name, balance
        from acct
	order by balance desc  -- 倒序排列
	limit 3;   -- 限定显示3笔

      e.g. 从第一笔开始，显示3笔数据
      select acct_no, acct_name balance
        from acct
	order by balance desc
	limit 0,3;

        * 注：经常利用limit m,n子句进行查询分页处理
	      m表示起始的行数(从0开始)
	      n表示每页有多少行
	      利用当前显示第几页、每页多少行就能计算出
	      m和n的值，实现分页查询
	      m = (页数 - 1) * 每页多少笔
	      n = 每页显示的笔数