

表的复制、重命名
  1）复制
    - 将源表完全复制为新表(包含表结构、数据)
      create table acct_new
      select * from acct;

      拷贝部分数据
      create table acct_new
      select * from acct where balance<2000;

      只拷贝表结构
      create table acct_new
      select * from acct where 1=0;
     *注意：这种方式复制表，不会把键属性复制过来

  2）重命名
    - 格式：
         alter table 表名 rename to 新表名

    - 示例：
         alter table acct rename to acct_new;
