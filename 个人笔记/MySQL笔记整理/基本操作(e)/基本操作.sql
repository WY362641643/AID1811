
MySQL安装配置
    windwos
    Ubuntu
	第一步：
	  sudo apt-get install mysql-server
	  sudo apt-get install mysql-client
	  sudo apt-get install libmysqlclient-dev

	第二步：查看是否安装成功
	  查看端口：netstat -an | grep 3306
	            如果3306是Listen状态，则成功

	  管理脚本：sudo /etc/init.d/mysql status
	            如果看到是Running状态，则成功

    MySQL服务启动、停止
     - 启动：sudo /etc/init.d/mysql start
     - 停止：sudo /etc/init.d/mysql stop
     - 重启：sudo /etc/init.d/mysql restart
     - 查看状态：sudo /etc/init.d/mysql status

    客户端与服务器
    - 服务器：mysqld  ( d表示Daemon简写 )
    - 客户端：mysql

    使用客户端连接服务器：
      命令：mysql -h服务器地址 -u用户名 -p用户密码
      示例：mysql -hlocalhost -uroot -p123456
      说明：mysql       运行mysql客户端程序
            -hlocalhost 服务器地址为本机(192.168.1.5)
	    -uroot      表示使用root用户登录连接
	    -p123456    表示root用户的密码是123456
            
	    备注：如果连接本机，-hlocalhost可以省略

1)SQL语言:结构化查询语言(Structured Query Language)

2)功能：用来对DBMS系统进行操作
          库、表管理
	  数据增、删、改、查（CRUD）
3)大小写不敏感
    不支持TAB自动补齐
    以分号结束
    使用\c可以废弃写错了的语句
4)库的基本操作
    1.查看已有库
        show databases;
    2.创建数据库
        create database 库名
			default charset=字符集；（默认为字符集Latin1)

		e.g. 创建名称位bank的库，使用utf8字符集
		create database bank default charset=utf8
	3.进入／切换库：　
			use 库名称；
		e.g 进入切换到bank库
			use bank;
	4.查看库中有那些表：show tables;

	5.删除库　srop database();
		e.g.　删除bank库
			srop database bank;

        create database 库名　character set utf8;
        建库的同时指定字符集
    6.查看创建库的语句（查看字符集）
        show create database 库名;
    7.查看当前所在库
        select database();


