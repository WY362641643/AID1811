

唯一约束(unique)

    - 字段的值不能重复


  - 语法：字段名称  类型 unique


    - 示例

        create table customer (
	    cust_no varchar(32) unique,-- 唯一约束
	    cust_name varchar(128) not null,
	    tel_no varchar(32) not null
	);

	-- 插入重复数据, 违反唯一性约束
	insert into customer
	values('C0001', 'Jerry', '13512345678');
	insert into customer
	values('C0001', 'Tom', '13212345678');