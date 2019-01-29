
-- 1. 创建库eshop，并指定编码为utf8

sudo /etc/init.d/mysql start -- 启动MySQL

mysql -hlocalhost -uroot -p123456  -- 链接服务器

show databases;  --　查看当前已有的数据库

create database eshop default charset=utf8; -- 创建库 eshop



-- 2. 创建订单表(orders, utf8编码),包含如下字段：

use eshop;  -- 进入库
show tables; -- 查看库中的表
create table orders(   -- 创建表orders
    order_id varchar(32), -- order_id 订单编号, 字符串, 32字节
    cust_id varchar(32),-- cust_id	客户编号, 字符串, 32字节
    order_date datetime,-- order_date	下单时间, DateTime类型
    status enum('1','2','3', -- status	订单状态, 枚举类型,取值范围
    '4','5','6','9'),  -- ('1','2','3','4','5','6','9')
    products_num int,-- products_num	订单包含的商品数量
    amt decimal(10,2)-- amt		订单总金额, 浮点数, 两位小数
)default charset=utf8;


create table status(  -- 创建订单状态表
    daima int, -- 状态代码
    zhuangtai varchar(32) -- 订单状态
)default charset=utf8;

insert into status values  -- 编写订单状态表
('1','待付款'),('2','待发货'),-- 1-待付款   2-待发货
('3','已发货'),('4','已收货'),-- 3-已发货   4-已收货
('5','申请退货'),('6','已退货'),-- 5-申请退货 6-已退货
('9','已废弃');-- 9-已废弃

select * from status; -- 查看表


-- 3. 至少插入5笔数据（要求数据看上去尽量真实）
insert into orders VALUES
('201901000001','c0001','2019-01-01 22:35:20','4','3','36.00'),
('201901000002','c0002','2019-01-02 12:45:20','9','2','30.00'),
('201901000003','c0003','2019-01-02 15:35:10','6','4','40.50'),
('201901000004','c0004','2019-01-02 18:33:20','3','6','55.80'),
('201901000005','c0005','2019-01-03 10:45:20','5','9','64.59'),
('201901000006','c0006','2019-01-03 12:35:05','1','8','88.88'),
('201901000007','c0007','2019-01-03 20:45:20','2','12','110.66'),
('201901000008','c0006','2019-01-03 22:35:05','2','7','87.88');


-- 4. 编写如下SQL语句
-- 1）查找所有待付款订单
select * from orders
where status = '1';


-- 2）查找所有已发货、已收货、申请退货订单
select * from orders
where status = '3'
or status = '4'
or status = '5';
-- 方法二
select * from orders
where status =('3','4','5');


-- 3）查找某个客户的待发货订单
select cust_id '客户名称'
from orders
where status = '2';


-- 4）根据订单编号，查找订单下单日期、订单状态
select order_id '订单编号',
       order_date '下单日期',
       status '订单状态'
from orders
where order_id = '201901000001';


-- 5）查找某个客户所有订单，并按照下单时间倒序排列
select * from orders
where cust_id = 'c0006'
order by order_date desc;


-- 6）统计每种状态的订单笔数
select status '订单状态',
       count(*) '订单笔数'
from orders
group by status;


-- 7）查询所有订单最大值/最小值/平均值,所有订单总金额
select max(products_num) from orders; --　订单最大值
select min(products_num) from orders; --　订单最小值
select avg(products_num) from orders; --　订单平均值
select sum(amt) from orders; --　订单总金额


-- 8）查询金额最大的前3笔订单
select * from orders
        order by amt desc  -- 倒序排列
        limit 3;


-- 9）在表的最后，添加两个字段：
-- invoice		开票状态，整数
-- invoice_date	开票日期，DateTime类型
alter table orders add invoice int;
alter table orders add incoice_dete datetime;

-- 10）修改某个订单状态为“已收货”
update orders
set status = '4'
where order_id = '201901000002';

-- 11）删除已废弃的订单
delete from orders where status = '9';
