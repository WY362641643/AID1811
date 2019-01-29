

默认值
    - 当插入数据时，该字段如果没有填值
      系统会自动填写默认值

    - 语法：字段名称 类型 default 默认值

    - 示例：

      alter table customer add status int default 0;
      -- tel_no未插入,则自动填默认值
      
      insert into customer
      (cust_no, cust_name, tel_no)
      values('C0002', 'Tom', '13233445566');


