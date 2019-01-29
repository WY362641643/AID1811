

权限管理（难点）

  1）权限：用户可以进行哪些操作

  2）分类：
    - 用户类：创建用户、删除用户、给用户授权
    - 库操作：创建库、删除库
    - 表操作：创建表、删除表
    - 数据操作：增、删、改、查

  3）权限表
    - user: 最重要的权限表，记录了允许连接到服务器
            的用户及具有的权限
    - db: 记录库的授权信息
    - tables_priv: 记录表的授权信息
    - columns_priv: 记录字段的授权信息

  5）授权
    - 语法：
      grant 权限列表 on 库名称.表名称
      to '用户名'@'客户端地址'
      [identified by '密码']
      [with grant option]

    - 说明：
      权限列表：被授权用户拥有哪些权限
         all privileges: 所有权限
	     select(查), insert(增),
         update(改), delete(删): 分别制定权限
    
    - 库名称.表名
         *.*		表示所有库、所有表
	 bank.*		表示bank库下所有表
	 bank.acct	特指bank库下的acct表

    - 客户端地址
         %		表示所有客户端
	 localhost	表示本机
	 192.168.1.5	表示制定192.168.1.5这台机器


    - 示例：
      示例1：给Daniel用户授予所有库、
             所有表的所有权限，所有客户端都能访问
	     并且将密码设置为'123456'
	     允许该用户向其他用户授权
	 grant all privileges on *.*
	 to 'Daniel'@'%'
	 identified by '123456'
	 with grant option;

	 执行成功后，重新加载权限设置生效：
	 flush privileges

	 重新Daniel用户登录验证：
	 mysql -uDaniel -p123456

      示例2：给Tom用户授权，能对所有库、所有表
             进行查询，限定只能从本机登录
	     并将密码设置为'123456'
	  grant select on *.*
	  to 'Tom'@'localhost'
	  identified by '123456';

	  执行成功，刷新权限，查询user表中Tom用户设置
	  
	  重新用Tom用户登录，执行查询(成功)
          执行插入（拒绝）、建表（拒绝）
   