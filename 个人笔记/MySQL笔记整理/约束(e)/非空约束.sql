

非空约束(not null)

    - 指定字段的值不能为空，如果插入时没有设置值
      并且没有默认值，插入就会报错


 - 语法：字段名称 字段类型 not null


    - 示例：
	create table customer (
	    cust_no varchar(32) not null,
	    cust_name varchar(128) not null,
	    tel_no varchar(32) not null
	);
    
	-- 插入数据,tel_no字段违反非空约束
	insert into customer(cust_no, cust_name)
	values('C0001', 'Jerry');
