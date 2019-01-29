

表操作（重点）！！！！！
	1.创建表
	　　create table 表名称（
			字段１　类型（长度）　约束，
			字段２　类型（长度）　约束，
			......
			） default charset=字符集；
		e.g.　创建acct(账户)表
			第一步：如果没有bank库，先创建库
			第二步：使用use命令，进入bank库
			第三步：执行建表SQL语句：
				create table acct(
					acct_no varchar(32),
					acct_name varchar(128)
				)default charset=utf8;
			第四步：使用show tables命令查看是否成功

	2.查看表结构：desc 表名称
		e.g. 　查看acct　表结构
			desc acct；

	3.查看创建表的SQL语句：　show create table 表名
		e.g.  查看acct 建表SQL 语句
		　show create table acct;

	4.删除表: drop table 表名
		e.g.  删除acct表
		　drop table acct;
	5.表结构调整(alter table)
  1）添加字段
    - 添加到最后一个字段
      alter table 表名 add 字段名 类型(长度)
    - 添加到第一个字段
      alter table 表名 add 字段名 类型(长度) first
    - 添加到指定位置
      alter table 表名 add 字段名 类型(长度) after 字段
    - 示例
      首先，创建新表
      create table student (
        stu_no   varchar(32),
    	stu_name varchar(64)
      );

      添加字段
      alter table student add age int; -- 添加到最后

      alter table student add id int first;-- 添加到最前

      alter table student add tel_no varchar(32)
         after stu_name;  -- 指定添加到stu_name后面   

  2）修改字段
     - 修改字段类型
       alter table 表名 modify 字段名 类型(长度)
     - 修改字段名称
       alter table 表名 
       change 旧字段名 新字段名 类型(宽度)
     - 示例：
      e.g. 将stu_name长度改为128
      alter table student modify stu_name varchar(128)
      
      e.g. 将age字段改为stu_age
      alter table student change age stu_age int;

  3）删除字段
    - 语法：alter table 表名 drop 字段名
    - 示例：删除id字段
            alter table student drop id; 