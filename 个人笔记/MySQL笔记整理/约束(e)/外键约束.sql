

外键（难点, 非重点）

    - 外键：在当前表不是主键，另一个表的主键

    - 作用：保证参照的完整性、一致性

    - 使用外键的条件
      表的存储引擎必须为InnoDB
      被参照字段在另外的表里必须是主键
      当前表中的字段类型和被参照的表中类型一致


  - 语法：
      constraint foreign key(当前表字段)
      references 参照表名(参照字段名称)
	  
	-- 添加外键约束
		alter table 次表 
		add foreign key(表字段) 
		references 主表(表字段);

    - 示例

	create table account(
	  acct_no varchar(32) primary key,
	  cust_no varchar(32) not null,
	  -- 在当前表的cust_no上添加外键约束
	  -- 参照customer表的cust_no字段
	  constraint foreign key(cust_no)
	  references customer(cust_no) 
	);

	-- 插入customer表中存在的客户
	-- 参照完整性正确,可以插入
	insert into account values('0001','C0001');
    
	-- C0004客户不存在, 参照完整性错误
	-- 插入时报错
	insert into account valuse('0002','C0004');

	-- 删除被参照的值, 也会报错
	-- C0001客户在account表中被参照使用
	delete from customer where cust_no='C0001';

　　-- 删除外键
	show create table 表名;
    alter table 表名 drop foreign key 外键名;