
-- 查看库　
show databases;
use eshop; -- 进入库
show tables; -- 查看表
alter table orders add PRIMARY KEY(order_id); -- 主键约束

-- 在cust_id, order_date, products_num字段上添加非空约束
alter table orders 
MODIFY cust_id VARCHAR(32) NOT NULL;

alter table orders 
MODIFY order_date DATETIME NOT NULL;

alter table orders 
MODIFY products_num int(11) NOT NULL;

-- 在status字段上添加默认值，默认值为1
alter table orders MODIFY status enum('1','2','3','4','5','6','9')
default 1;

-- 在order_date上添加普通索引
create index order_date_i on orders(order_date);



-- 2.创建客户信息表(customers)，包含字段有
create table customers(
-- cust_id	客户编号，字符串，32位，主键
cust_id VARCHAR(32) PRIMARY KEY,

-- cust_tel	客户电话，字符串，32位，非空
cust_tel VARCHAR(32) NOT NULL,

-- cust_name	客户姓名，字符串，64位，非空
cust_name VARCHAR(64) NOT NULL,

-- address	送货地址，字符串，128位，非空
address VARCHAR(128) NOT NULL
)default charset=utf8;



-- 3. 为customers表添加数据，要求每个orders表中的
-- cust_id都有对应的客户信息
INSERT INTO customers VALUES
('c0001','12312345678','刘备','桃园'),
('c0003','15312345678','诸葛亮','茅庐'),
('c0004','17312345678','赵云','长坂坡'),
('c0005','18312345678','张飞','当阳桥'),
('c0006','13212345678','周瑜','赤壁'),
('c0007','18212345678','曹操','官渡');


-- 4. 在orders表的cust_id上创建外键约束 
-- 参照customers表的cust_id字段

alter table orders 
add foreign key(cust_id) 
references customers(cust_id);