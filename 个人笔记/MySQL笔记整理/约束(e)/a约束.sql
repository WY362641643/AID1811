
1. 约束（constraint）
  1）约束：数据遵循的规则，为了保证数据
          完整性、一致性、有效性

  2）约束类型

    - 非空约束(not null)：字段值不能为空
        语法： 
      　　 　字段名称　字段类型　not NULL


    - 唯一约束(unique)：字段值不能重复
        语法：
        　　 字段名称　字段类型　unique


    - 主键约束(primary key,简写PK)：指定字段作为主键，非空、唯一
        语法：
        　　 字段名称　字段类型　primary KEY
        已有表中添加主键
        alter table 表名 add primary key(id);


    - 默认值：未填写值的情况下，自动填默认值
        语法：
        　　 字段名称　字段类型　default 默认值


    - 自动增加：字段的值自动增加
        语法：
        　　 字段名称　字段类型　auto_increment


    - 外键约束：某个属性，在当前表不是主键
                在另一个表里是主键
		参照外键时，外键对应的实体必须存在
         语法：
             constraint FOREIGN KEY(当前字表段)
             references 参照表名(参照字段名称)
