
索引（重点）
 1）索引(Index)
     - 是一种提高查询效率的技术，相当于书的目录

     - 包含着记录的引用的指针，根据引用指针快速
       找到数据存放的位置

     - 通过避免全表扫描，来提高查询效率



 2）索引类别
     - 普通索引、唯一索引
     - 单列索引、组合索引



 3）如何创建索引
     - 创建表时候创建索引
     语法:
         字段名 字段类型 [index|unique|primary key]
             index            普通索引
	         unique           唯一索引
	         primary key      主键，自动成为唯一索引

     示例1：创建账户交易明细表，并在交易流水号上创建唯一索引
         create table acct_trans_detail (
	     trans_sn  varchar(32) not null, -- 交易流水号
	     trans_date datetime not null, -- 交易时间
	     acct_no varchar(32) not null, -- 交易账号
	     trans_type int , -- 交易类型
			   -- 存款, 取款, 刷卡, 结息

	     amt decimal(16,2) not null, -- 交易金额
	     unique(trans_sn),   -- 在trans_sn上创建唯一索引
	     index(trans_date)   -- 在trans_date上建立普通索引
	     );

 -- 查看索引
     语法: 
         show index from 表名;
     e.g
	     show index from acct_trans_detail;

 -- 插入数据
     语法：
         insert into 表名 values(字段值);
     e.g
	     insert into acct_trans_detail
	     values('201801010001',now(),'622345000001',1,1000);

 -- 查询时使用索引字段作为条件, 就会使用到索引
	 select * from acct_trans_detail
	 where trans_sn = '201801010001';

 -- 通过修改表的方式创建索引
     语法:
         create 索引类型 索引名称 on 表名(字段名)
      或：
	     alter table 表名 add 索引类型 索引名称(字段)
     
     e.g:
	     create index trans_date on 
	     acct_trans_detail(trans_date);

	     alter table acct_trans_detail
	     add unique index trans_sn(trans_sn);
  
 -- 删除索引
     语法：
         drop index 索引名称 on 表名
	 e.g. 
         drop index trans_date on acct_trans_detail

 4）索引优缺点
     优点
         提高查询效率
         唯一索引能够保证数据的唯一性
         在使用索引字段分组、排序时，效率会提高

     缺点
         需要额外的存储空间
         创建和维护索引需要额外的时间
         降低增、删、改的效率

 5）索引使用原则
     - 使用恰当的索引
     - 索引并不是越多越好，索引太多影响增删改效率

     - 适合使用索引的情况
       字段经常作为查询条件
       字段的值相对均匀、连续
       如果某个字段经常用来作为排序依据，适合加索引

     - 不适合使用索引的情况
       不经常作为查询条件
       值太少的字段不适合建索引(性别、账户状态)
       数据量太少不适合建立索引
       二进制类型的数据字段不适合建索引