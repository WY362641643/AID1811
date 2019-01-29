

数据导入导出
 导出
     - 格式
          select　查询语句
         into outfile '文件路径'
         fielde terminated by '字段分隔符'
         lines terminated by '行分隔符'
     - 示例：
         第一步：查看数据库允许导出的目录路径
             show variables like 'secure_file%';
            路径地址为：
             secure_file_priv: /var/lib/mysql-files/
      
         第二步：执行导出（导出到第一步所看到的目录下）
           格式:
              select 字段名 from 表名
              into outfile '文件路径'
              fielad terminated by '字段分隔符'
              lines terminated by '行分隔符'
             e.g
              select * from acct
	          into outfile '/var/lib/mysql-files/acct.bak'
              fields terminated by ','
	          lines terminated by '\n';

         第三步：查看导出的文件
             sudo cat /var/lib/mysql-files/acct.bak

  2）导入
    - 格式
      load data infile '备份文件路径'
      into table 表名称
      fields terminated by '字段分隔符'
      lines terminated by '行分隔符';
    - 示例
      load data infile '/var/lib/mysql-files/acct.bak'
      into table acct
      fields terminated by ','  -- 指定字段分割符
      lines terminated by '\n'; -- 指定行分隔符


  终端上运行：
             file 查看文件类型
             cat  打开文件