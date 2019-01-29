
distinct子句
    - 作用：对某个字段值去重
    - 格式：select distinct(字段名称) from 表名称
    - 示例：
      e.g. 查看账户表中一共有多少种账户类型
      select distinct(acct_type) from acct;