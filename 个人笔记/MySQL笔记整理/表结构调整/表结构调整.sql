
表结构调整(alter table)
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
