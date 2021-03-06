
存储引擎：
  表的存储方式，包括：存储机制，索引机制，锁定方式

  基本操作：
    查看支持的存储引擎：
      show engines

    查看某个表的存储引擎:
      show create table 表名

    建表时指定存储引擎
      create table t1(
          name varchar(32)
      )engine=InnoDB;

    修改表的存储引擎：
      alter table t1 engine=MyISAM;



    常用存储引擎的特点：
      InnoDB
        支持数据库事物，行锁定，支持外键(FK)
        共享表空间
          表名.frm:存储的表结构和索引
          表名.ibd:存储的表记录

          ＊通过show global variables '%datadir%'
            查看mysql表存储的文件目录

        使用场合：
          更新密集操作的表,并发效率较高
          要求支持数据库事务
          要求支持外键约束
          要求支持auto_increment字段


      MyISAM
        支持表级锁定，不支持事务，不支持外键
        不支持行锁定，访问速度较快

        独享表空间
          表名称.frm: 表结构
          表名称.myd: 表数据
          表名称.myi: 表索引

        适合场所
          查询操作较多
          数据一致性要求较低(不支持事务)
          没有外键的约束


      Memory(内存表):
        表结构存储在磁盘上，数据存储在内存，访问速度快
        文件:
          表名.frm   存储表结构
        
        服务(或机器)重启后，比表中的数据丢失
        适用场合:
          数据量小，访问速度要求极快，访问频率高，数据丢失后不会造成影响        