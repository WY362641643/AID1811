

连接查询（联合查询）(重点))
  1）笛卡尔积
    - 定义：两个集合乘积，每个集合中元素两两组合
            产生的新集合

    - 意义：表示两个集合所有可能的情况组合
       A：学生集合     B：课程集合
       A和B的笛卡尔积表示所有学生可能的选课情况
       A：所有声母     B：所有韵母
       A和B的笛卡尔积表示所有可能的拼音组合

    - 笛卡尔积和关系（二维表）：
      （没有实际意义）数据
      去掉这部分数据就是关系

      例如：bun在汉语拼音中不存在，应该去掉



  2）连接查询
    - 什么是连接查询：将两个（或以上）的表连接起来
          得到一个新表（可以叫表的连接）

    - 什么时候使用连接查询：当从一个表中无法获得
         所有想要的数据时候，使用联合查询
	 （前提是两个表数据有关联关系）

    - 示例：
    -- 连接查询
	select a.acct_no, a.acct_name,
	       c.tel_no
	from acct a, customer c 　-- a,c为表的别名
	where a.cust_no = c.cust_no; -- 连接条件
	
	* 通过字段关联，如果关联到数据则显示
	  如果未关联到数据，则不显示
	  这种连接查询称之为内连接



  3）连接分类
    - 内连接：关联到的数据显示，没有关联到数据不显示
      格式： 
             select 字段列表 from 表A
             inner join 表B
	         on 关联条件

      示例：
             select a.acct_no, a.acct_name, c.tel_no
             from acct a 
	         inner join customer c
	         on a.cust_no = c.cust_no;


    - 外连接：
        没有关联到的数据也显示
             （指定哪个表的数据全部显示）

      左连接：
         左表为主，左表内容全部显示，右表匹配
         左连接格式：
             select 字段列表 from 表A
	         left join 表B
	         on 关联条件

      示例：
         查询账户、户名、客户电话，如果账户对应
            的客户不存在，也要显示账户、户名
	     select a.acct_no, a.acct_name, c.tel_no
	     from acct a 
	     left join customer c
	     on a.cust_no = c.cust_no;


      右连接：
         右表为主，右表内容全部显示，左表匹配
         右连接格式：
             select 字段列表 from 表A
             right join 表B
             on 关联条件

      示例：      
	     select a.acct_no, a.acct_name, c.tel_no
	     from acct a 
	     right join customer c
	     on a.cust_no = c.cust_no;
