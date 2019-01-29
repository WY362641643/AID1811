
聚合函数：最大值、最小值、平均值、求总和

               返回的都是一行一列的集合

    - max/min: 求最大值、最小值
      e.g. 求所有账户余额的最大值
      select max(balance) from acct;

    - avg: 求平均值
      e.g. 求所有账户余额的平均值
      select avg(balance) from acct;

    - sum：对字段求和
      e.g.  求所有账户余额之和
      select sum(balance) from acct;

    - count: 统计笔数
      e.g.  统计账户数量
      select count(*) from acct;
      * 注：count后的括号中可以跟字段、数字
            但是如果跟字段，当字段值为null则
	        不会参与统计
