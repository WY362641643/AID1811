

自动增长

    - 当字段设置为自动增长时，插入数据不需要填值，
      数据库系统会自动在上一个值上面增加1
      经常和PK配合使用


  - 语法：字段名 字段类型 auto_increment


    - 示例

      create table ai_test(
        id int primary key auto_increment,
	name varchar(32)
      );
      -- 插入数据
      insert into ai_test values(null, 'aaa');-- id=1
      insert into ai_test values(null, 'bbb');-- id=2
      insert into ai_test values(null, 'ccc');-- id=3
