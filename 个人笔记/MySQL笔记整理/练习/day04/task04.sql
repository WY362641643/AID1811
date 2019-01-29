
sudo /etc/init.d/mysql status --　启动客服端

mysql -uroot -p123456      -- 链接服务器

use eshop;  --　进入库


-- 利用子查询，查询所有订单状态为"申请退货"的
--  客户的名称、电话号码
select cust_name,cust_tel,cust_id from customers
where cust_id in (
    select distinct cust_id from orders 
    where STATUS = '5'
);


-- 利用连接查询，查询"待送货"订单的信息
--  查询结果包含的字段有：
--  订单编号 下单时间 客户编号 客户电话 送货地址
select o.order_id,o.order_date,
        c.cust_id,c.cust_name,
        c.cust_tel,c.address 
    from orders o, customers c 
    where o.status = '2'
    and o.cust_id = c.cust_id;


-- 创建eshop_admin用户，并授权：
-- 1）eshop库所有表、所有权限

grant all privileges on eshop.*
to 'eshop_admin'@'%'
identified by '123456'
with grant option;

-- 创建eshop_user用户，并授权：
-- 1）eshop库中所有表的查询权限
-- 2）允许从任意客户端登录
-- 3）设置密码
grant select on eshop.*
to 'eshop_user'@'%'
identified by '123456';