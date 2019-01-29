

主键约束(Primary Key, 简写PK)

    - PK用来唯一标识一笔记录，要求非空、唯一
      PK和一笔记录之间有唯一对应关系
      PK可以是一个字段构成，也可以多个属性共同构成


  - 语法：字段名称 字段类型 Primary Key


    - 示例
	create table customer (
	  cust_no varchar(32) primary key,-- 主键
	  cust_name varchar(128) not null,
	  tel_no varchar(32) not null
	);
    -- 插入数据
	insert into customer
	values('C0001', 'Jerry', '13512345678');

	insert into customer -- 违反非空约束
	values(null, 'Jerry', '13512345678');

	insert into customer -- 违反唯一性约束
	values('C0001', 'Jerry', '13512345678');